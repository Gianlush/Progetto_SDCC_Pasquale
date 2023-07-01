import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/HomePage.dart';
import 'package:frontend_sdcc_flutter/widget/Logo.dart';

import '../object/User.dart';
import '../utility/Model.dart';
import '../widget/Popup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  static User userLogged;

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage>{

  TextEditingController emailAddressController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController surnameController;
  bool passwordVisibility;
  bool logging;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    logging = true;
  }

  @override
  Widget build(BuildContext context) {
    if(logging) {
      return loginView();
    } else {
      return signUpView();
    }
  }

  Widget loginView(){
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.jpg'),
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Logo(color: Colors.indigoAccent),
                              const Text("Bentornato,",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Urbanist',
                                    color: Colors.black,
                                    fontSize: 24
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: emailAddressController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Email Address',
                                    hintText: 'Inserisci qui la tua email ...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              enterPasswordWidget(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RawMaterialButton(
                                    onPressed: logging ? () => login() : () => signup(),
                                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    fillColor: Colors.indigo,
                                    child: const Text("Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 18
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Non hai un'Account?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () => setState(() {
                                        emailAddressController.clear();
                                        passwordController.clear();
                                        logging = !logging;
                                      }),
                                      child: const Text("Crea Account",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            fontSize: 12
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]
                        ),
                      )
                  )
                ]
            )
        )
    );
  }

  Widget signUpView(){
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.jpg'),
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Logo(color: Colors.indigoAccent),
                              const Text("Benvenuto,",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Urbanist',
                                    color: Colors.black,
                                    fontSize: 24
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: nameController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Nome',
                                    hintText: 'Inserisci qui il tuo nome...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: surnameController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Cognome',
                                    hintText: 'Inserisci qui il tuo cognome...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: emailAddressController,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    labelText: 'Email Address',
                                    hintText: 'Inserisci qui la tua email...',
                                    hintStyle: const TextStyle(
                                        color: Colors.black54
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                ),
                              ),
                              enterPasswordWidget(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RawMaterialButton(
                                    onPressed: logging ? () => login() : () => signup(),
                                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    fillColor: Colors.indigo,
                                    child: const Text("Registrati",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 18
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Hai già un'Account?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () => setState(() {
                                        emailAddressController.clear();
                                        nameController.clear();
                                        surnameController.clear();
                                        passwordController.clear();
                                        logging = !logging;
                                      }),
                                      child: const Text("Login",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            fontSize: 12
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]
                        ),
                      )
                  )
                ]
            )
        )
    );
  }
  enterPasswordWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: TextFormField(
          controller: passwordController,
          style: const TextStyle(
              color: Colors.black
          ),
          obscureText: !passwordVisibility,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black54,
            ),
            labelText: 'Password',
            hintText: 'Inserisci qui la tua password...',
            hintStyle: const TextStyle(
                color: Colors.black54
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
            suffixIcon: InkWell(
              onTap: () => setState(
                    () => passwordVisibility =
                !passwordVisibility,
              ),
              focusNode: FocusNode(skipTraversal: true),
              child: Icon(passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: Colors.grey,
                size: 22,
              ),
            ),
          ),
        )
    );
  }


  login(){
    if(emailAddressController.text.isEmpty || passwordController.text.isEmpty) {
      showPopop(context, "Campi incompleti!");
      return;
    }
    Model.sharedInstance.login(emailAddressController.text, passwordController.text).then((value) {
      LoginPage.userLogged = value;
      if(value == null) {
        showPopop(context, "Credenziali Errate!");
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
    });
  }

  signup(){
    if(nameController.text.isEmpty || emailAddressController.text.isEmpty || surnameController.text.isEmpty || passwordController.text.isEmpty) {
      showPopop(context, "Campi incompleti!");
      return;
    }
    User user = User(
        name: nameController.text,
        email: emailAddressController.text,
        surname: surnameController.text,
        password: sha256.convert(utf8.encode(passwordController.text)).toString()
    );
    Model.sharedInstance.signup(user).then((value) {
      if(value == null) {
        showPopop(context, "Email già in uso!");
        return;
      }
      LoginPage.userLogged = value;
      if(value!=null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
      }
    });
  }
}