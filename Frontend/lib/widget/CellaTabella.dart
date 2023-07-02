import 'package:flutter/material.dart';

class CellaTabella extends StatelessWidget{

  const CellaTabella({Key key, @required this.testo, @required this.scale,@required this.colore, this.icona}) : super(key: key);

  final String testo;
  final Color colore;
  final double scale;
  final IconData icona;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*scale,
      height: MediaQuery.of(context).size.height*0.07,
      decoration: BoxDecoration(
          color: colore.withOpacity(0.95),
          border: const Border.fromBorderSide(BorderSide(color: Colors.black))
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*(scale-0.02)),
                child: Text(
                  testo,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              icona==null ? const SizedBox.shrink() :
              Icon(icona)
            ],
          ),
      ),
    );
  }

}