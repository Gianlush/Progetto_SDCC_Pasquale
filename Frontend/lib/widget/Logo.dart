import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Logo extends StatelessWidget{

  const Logo({Key key, @required this.color}) : super(key: key);

  final Color color;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
          StrokeText(
              text: "My FileSharing  ",
              strokeWidth: 2,
              strokeColor: Colors.black,
              textStyle: TextStyle(
                color: color,
                fontSize: 60,
                fontFamily: 'Pacifico',
              )
          ),
          const Image(
            image: AssetImage('assets/images/logo.png'),
            width: 140,
            height: 140,
          )
        ]
    );
  }

}