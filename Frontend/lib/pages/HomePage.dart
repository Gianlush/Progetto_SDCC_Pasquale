import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';
import 'package:frontend_sdcc_flutter/widget/FileView.dart';
import 'package:frontend_sdcc_flutter/widget/TypeFile.dart';

import '../object/MyFile.dart';
import '../utility/Model.dart';
import '../widget/CellaTabella.dart';
import '../widget/Logo.dart';
import '../widget/showPopup.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextController;
  TextEditingController nomeFileTextController;
  TextEditingController descrizioneFileTextController;
  List<String> listExtension;
  String extensionSelected;
  int pageNumber;
  List<MyFile> files;
  bool moreFiles;
  MyFile toAdd;
  IconData sortByNameIcon;
  IconData sortByExtIcon;
  List<IconData> sortByIcons;
  String sortByLatest;

  @override
  void initState() {
    super.initState();
    toAdd = MyFile();
    files = [];
    sortByLatest = "Nome";
    sortByNameIcon = Icons.keyboard_arrow_down;
    sortByExtIcon = Icons.keyboard_arrow_down;
    sortByIcons = [
      Icons.keyboard_arrow_down,
      Icons.keyboard_arrow_up,
    ];
    pageNumber=0;
    moreFiles = false;
    extensionSelected  = "Ogni File";
    searchTextController = TextEditingController();
    nomeFileTextController = TextEditingController();
    descrizioneFileTextController = TextEditingController();
    listExtension = [
      "Ogni File","pdf","png","xlsx","ppt","doc","txt","jpg","zip", "jpeg","docx",
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
                //color: Colors.lightBlueAccent.shade700.withOpacity(0.75),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/header.jpg'),
                  ),
                ),
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
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                        controller: searchTextController,
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
                          LoginPage.userLogged==null || !LoginPage.userLogged.admin ? const Padding(padding: EdgeInsets.fromLTRB(0, 90, 0, 0)) :
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.grey, width: 1)),
                              padding: const EdgeInsets.fromLTRB(15,15,15,15),
                              onPressed: () => creaFile(),
                              fillColor: Colors.indigo,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("Nuovo File",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                                      child: Icon(Icons.cloud_upload_outlined, size: 25, color: Colors.white,)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.black),
              Container(
                  height: MediaQuery.of(context).size.height*0.7,
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
                      files.isEmpty? const SizedBox.shrink() : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.07,
                          width: MediaQuery.of(context).size.width*0.80,
                          child: Row(
                            children: [
                              InkWell(
                                child: CellaTabella(testo: "Nome", scale: 0.24, colore: Colors.lightBlueAccent.shade200, icona: sortByNameIcon),
                                onTap: () => switchIcon("Nome"),
                              ),
                              InkWell(
                                child: CellaTabella(testo: "Estensione", scale: 0.09, colore: Colors.lightBlueAccent.shade200, icona: sortByExtIcon),
                                onTap: () => switchIcon("Estensione"),
                              ),
                              CellaTabella(testo: "Descrizione", scale: 0.37, colore: Colors.lightBlueAccent.shade200),
                              CellaTabella(testo: "Download", scale: 0.10, colore: Colors.lightBlueAccent.shade200),
                            ],
                          ),
                        ),
                      ),
                      files.isEmpty? const SizedBox.shrink() : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.42,
                          width: MediaQuery.of(context).size.width*0.80,
                          child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FileView(file: files[index])
                                  ]
                              );
                            },
                          ),
                        ),
                      ),
                      files.isEmpty? const SizedBox.shrink() : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            child: const Icon(Icons.arrow_back_ios_sharp),
                            onPressed: () => previousPage(),
                          ),
                          Text(pageNumber.toString(), style: const TextStyle(color: Colors.black)),
                          RawMaterialButton(
                              child: const Icon(Icons.arrow_forward_ios_sharp),
                              onPressed: () => nextPage()
                          )
                        ],
                      )
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
  nextPage()  {
    setState(() {
      if(files.length==6 && moreFiles) {
        pageNumber++;
        search();
      }
    });
  }
  previousPage(){
    setState(() {
      if(pageNumber>0) {
        pageNumber--;
      } else {
        return;
      }
      search();
    });
  }

  search(){
    String estensione = extensionSelected=="Ogni File" ? "" : extensionSelected;
    int sortDirection = sortByLatest=="Nome" ? sortByIcons.indexOf(sortByNameIcon) : sortByIcons.indexOf(sortByExtIcon);
    Model.sharedInstance.searchFiles(nome: searchTextController.text, estensione: estensione, pageNumber: pageNumber, sortDirection: sortDirection, sortBy: sortByLatest).then((value) {
      setState(() {
        files = value;
      });
    });
    Model.sharedInstance.searchFiles(nome: searchTextController.text, estensione: estensione, pageNumber: pageNumber+1, sortDirection: sortDirection, sortBy: sortByLatest).then((value) {
      setState(() {
        moreFiles = value.isNotEmpty;
      });
    });
  }

  creaFile(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Crea File'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: nomeFileTextController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          icon: Icon(Icons.add_link_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: descrizioneFileTextController,
                        decoration: const InputDecoration(
                          labelText: 'Descrizione',
                          icon: Icon(Icons.description_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              RawMaterialButton(
                  child: const Text("Scegli File"),
                  onPressed: () => pickFile()),
              RawMaterialButton(
                  child: const Text("Conferma"),
                  onPressed: () => submitNewFile()),
              RawMaterialButton(
                  child: const Text("Annulla"),
                  onPressed: () => setState(() {
                    nomeFileTextController.clear();
                    descrizioneFileTextController.clear();
                    Navigator.of(context).pop();
                  })),
            ],
          );
        });
  }

  switchIcon(String column){
    if(column=="Nome"){
      setState(() {
        int index = sortByIcons.indexOf(sortByNameIcon);
        sortByNameIcon = sortByIcons[(index+1)%2];
        sortByLatest = "Nome";
      });
    } else {
      setState(() {
        int index = sortByIcons.indexOf(sortByExtIcon);
        sortByExtIcon = sortByIcons[(index+1)%2];
        sortByLatest = "Estensione";
      });
    }
    search();
  }

  submitNewFile(){
    if(toAdd.bytes==null) {
      showPopop(context, "Selezionare un File!");
      return;
    }
    if(nomeFileTextController.text.trim().isEmpty || descrizioneFileTextController.text.trim().isEmpty) {
      showPopop(context, "Compilare tutti i campi!");
      return;
    }
    if(descrizioneFileTextController.text.length>125){
      showPopop(context, "Numero massimo di caratteri: 125", title: "Descrizione troppo lunga!");
      return;
    }

    toAdd.nome = nomeFileTextController.text;
    toAdd.descrizione = descrizioneFileTextController.text;
    Model.sharedInstance.createFile(toAdd).then((value) {
      Navigator.of(context).pop();
      setState(() {
        nomeFileTextController.clear();
        descrizioneFileTextController.clear();
      });
      if(value==null){
        showPopop(context, "Salvataggio File non eseguito correttamente!");
      } else {
        showPopop(context, "Salvataggio File eseguito correttamente!", title: "Successo!");
      }
    });
  }

  Future<void> pickFile() async {
    List<String> allowedExtension = ["pdf","png","xlsx","ppt","txt","jpg","zip","doc",  "jpeg","docx"];
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: allowedExtension);
      for(PlatformFile file in result.files){
        if(!allowedExtension.contains(file.extension)) {
          showPopop(context, "Selezionato un file con il formato sbagliato!",title: "Errore!");
          return;
        }

      }
      setState(() {
        toAdd.bytes = result.files.first.bytes;
        toAdd.estensione = result.files.first.extension;
        showPopop(context, "File selezionato correttamente!", title: "Successo!");
      });
    } catch (e){
      print(e);
      print("------ Pick file annullato");
    }
  }

  logout(){
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
      LoginPage.userLogged = null;
    });
  }
}
