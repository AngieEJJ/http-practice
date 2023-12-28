

import 'package:practice_image_search/data_source/pixabay_api.dart';
import 'package:practice_image_search/mapper/image_mapper.dart';
import 'package:practice_image_search/model/content_item.dart';

class ContenItemRepository {
  final _api = PixabayApi();

  Future<List<ContentItem>> getImagesItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}