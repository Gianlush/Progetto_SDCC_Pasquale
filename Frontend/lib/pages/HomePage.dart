import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/object/Book.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';
import 'package:frontend_sdcc_flutter/widget/BookCover.dart';
import 'package:frontend_sdcc_flutter/widget/TypeFile.dart';
import 'package:stroke_text/stroke_text.dart';

import '../utility/Model.dart';
import '../widget/Logo.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController;
  Map<String, bool> autori;
  List<String> autoriSelezionati;
  List<String> generiSelezionati;
  List<String> etaSelezionate;
  Map<String, bool> eta;
  Map<String, bool> genere;
  List<Book> books = [];
  List<String> listExtension = [];
  String extensionSelected = "pdf";


  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: "");
    listExtension = [
      "pdf","xls","ppt","image","txt","zip","doc"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 15, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 35),
                              child: Logo(color: Colors.white)
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.black, width: 2)),
                              padding: const EdgeInsets.fromLTRB(10,10,10,10),
                              onPressed: () => logout(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("Logout",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                                      child: Icon(Icons.account_circle_outlined, size: 25, color: Colors.black,)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          decoration: BoxDecoration(
                            border: const Border.fromBorderSide(
                                BorderSide(
                                    color: Colors.black54,
                                    width: 2
                                )
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    style: const TextStyle(
                                        color: Colors.black
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search, color: Colors.black54),
                                      labelStyle: const TextStyle(
                                          color: Colors.white
                                      ),
                                      hintText: 'Cerca qui il tuo File...',
                                      hintStyle: const TextStyle(
                                          color: Colors.black54
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: RawMaterialButton(
                                      onPressed: () => search(),
                                      padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                      fillColor: Colors.indigo,
                                      child: const Text("Cerca",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            fontSize: 18
                                        ),
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.black),
              Container(
                  height: MediaQuery.of(context).size.height*0.81001,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      // fit: BoxFit.fill,
                      image: AssetImage('assets/images/background1.jpg'),
                      opacity: 0.85,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(65, 20, 0, 0),
                            child: Text("Filtra per:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 8, 0, 0),
                            child: DropdownButton<String>(
                              items: listExtension.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 6, 0), child: TypeFile(type: value)),
                                );}).toList(),
                              value: extensionSelected,
                              dropdownColor: Colors.white,
                              onChanged: (String newValue) => {
                                setState(() {
                                  extensionSelected = newValue;
                                  search();
                                })
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.50,
                              width: MediaQuery.of(context).size.width*0.80,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.0),
                                border: const Border.fromBorderSide(BorderSide(color: Colors.black))
                              ),
                              
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          )
      ),
    );
  }

  search(){

  }

  logout(){
    setState(() {
      LoginPage.userLogged = null;
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
  }

  authorsCheck(bool value, String key) {
    setState(() {
      autori[key] = value;
      if(value) {
        autoriSelezionati.add(key);
      } else {
        autoriSelezionati.remove(key);
      }
    });
    search();
  }


  ageCheck(bool value, String key) {
    setState(() {
      eta[key] = value;
      if(value) {
        etaSelezionate.add(key);
      } else {
        etaSelezionate.remove(key);
      }
    });
    search();
  }


  genreCheck(bool value, String key) {
    setState(() {
      genere[key] = value;
      if(value) {
        generiSelezionati.add(key);
      } else {
        generiSelezionati.remove(key);
      }
    });
    search();
  }

}
