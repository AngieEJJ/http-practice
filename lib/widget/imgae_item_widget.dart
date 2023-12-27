// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:image_search_app/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    Key? key,
    required this.imageitem,
  }) : super(key: key);

  final ImageItem imageitem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageitem.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
