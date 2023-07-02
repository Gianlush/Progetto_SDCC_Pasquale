import 'package:flutter/material.dart';

showPopop(BuildContext context, String message, {String title="Errore:"}) {
  showDialog(
      context: context,
      barrierDismissible: false, // disables popup to close if tapped outside popup (need a button to close)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: const Text("Close"),
              onPressed: () { Navigator.of(context).pop(); }, //closes popup
            ),
          ],
        );
      }
  );
}