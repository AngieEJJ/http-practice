import 'package:image_search_app/data_source/pixabay_api.dart';
import 'package:image_search_app/mapper/image_maper.dart';
import 'package:image_search_app/model/image_item.dart';


abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}


class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async{
   final dto = await _api.getImagesResult(query);

   if(dto.hits == null) {
     return [];
   }

   return dto.hits!.map((e) => e.toImageItem()). toList();

  }


}



class MockImageItemRepository implements ImageItemRepository { // ImageItemRepository 인터페이스를 구현한다.
  @override
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

