import 'package:flutter/material.dart';

import '../object/Book.dart';

class BookCover extends StatelessWidget {


  @override
  const BookCover({Key key, @required this.book, this.proportion, this.clickable}) : super(key: key);

  final Book book;
  final double proportion;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    String image = book.name.replaceAll(" ", "_");
    image = image.replaceAll("à", "a").trim();
    return InkWell(
      onTap:clickable? () {} : null,
      child: Container(
        width: 175*proportion,
        padding: const EdgeInsets.fromLTRB(10,6,10,8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.blueAccent,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: Image(
                image: AssetImage('assets/images/cover/$image.jpg'),
                width: 140*proportion,
                height: 180*proportion,
              ),
            ),
            Text(book.name ,
              style: const TextStyle(color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

}