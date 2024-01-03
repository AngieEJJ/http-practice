import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../data/model/image_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    final imageItem = ImageItem(imageUrl: 'imageUrl');

    return Scaffold(
      body: Column(
          children: [
        Expanded(
          child: GestureDetector(
            child: Hero(
              tag: '1',
              child: Image.network(
              imageItem.imageUrl
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
