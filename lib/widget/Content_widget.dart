
import 'package:flutter/material.dart';
import 'package:practice_image_search/model/content_item.dart';

class ContentWidget extends StatelessWidget {
  final ContentItem contentItem;

  const ContentWidget({
    super.key,
    required this.contentItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        contentItem.imageUrl
       ,
        fit: BoxFit.cover,
      ),
    );
  }
}
