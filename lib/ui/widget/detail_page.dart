import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.imgUrl});
final String imgUrl;


  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;

    return Scaffold(
      body: Column(
          children: [
        Expanded(
          child: GestureDetector(
            child: Hero(
              tag: imgUrl,
              child: Image.network(
              imgUrl
              ,fit: BoxFit.contain),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    );
  }
}
