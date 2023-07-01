import 'package:flutter/material.dart';

class BorderedIcon extends Icon {
  const BorderedIcon({Key key}) : super(null, key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shape: StarBorder(
            pointRounding: 0.10,
              side: BorderSide(
                color: Colors.black87,
                width: 1,
              )
          )
      ),
      child: const Icon(
        Icons.star,
        size: 30,
        color: Colors.amber,
      ),
    );
  }

}

