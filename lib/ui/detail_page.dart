import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;

    return Scaffold(
      body: Column(
          children: [
        Expanded(
          child: GestureDetector(
            child: Hero(
              tag: '1',
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2023/12/26/02/21/bird-8469368_640.jpg',
                  fit: BoxFit.contain),
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
