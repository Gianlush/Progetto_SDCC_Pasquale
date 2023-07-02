import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';

import '../object/MyFile.dart';
import '../utility/Model.dart';
import 'CellaTabella.dart';

class FileView extends StatelessWidget{

  const FileView({Key key, @required this.file}) : super(key: key);

  final MyFile file;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CellaTabella(testo: file.nome, scale: 0.24, colore: Colors.lightBlueAccent.shade700),
        CellaTabella(testo: file.estensione,scale: 0.09, colore: Colors.lightBlueAccent.shade700),
        CellaTabella(testo: file.descrizione,scale: 0.37, colore: Colors.lightBlueAccent.shade700),
        Container(
          width: MediaQuery.of(context).size.width*0.1,
          height: MediaQuery.of(context).size.height*0.07,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade700.withOpacity(0.95),
              border: const Border.fromBorderSide(BorderSide(color: Colors.black))
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.download_for_offline_outlined, color: Colors.black),
              onPressed: () => download(),
            ),
          ),
        )
      ],
    );
  }

  download() async {
    Model.sharedInstance.getFileBytes(file.id).then((value) async {
      await FileSaver.instance.saveFile(name: file.nome+"."+file.estensione, bytes: value);
    });
  }

}