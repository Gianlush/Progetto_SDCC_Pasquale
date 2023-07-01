import 'package:flutter/material.dart';

class TypeFile extends StatelessWidget{

  const TypeFile({Key key, @required this.type}) : super(key: key);

  final String type;


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type),
          const SizedBox(width: 10),
          Image.asset("icons/filetype/"+type+".png", height:32)
        ]
    );
  }

}