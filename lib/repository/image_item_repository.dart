import 'package:image_search_app/model/image_item.dart';
class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'apple') {
      return [
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
      ];
    } else {
      return [
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
        ImageItem(imageUrl:
        'https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg'),
      ];
    }
  }
}

