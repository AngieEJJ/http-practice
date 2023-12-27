import 'package:image_search_app/dto/PixabayDto.dart';
import 'package:image_search_app/model/image_item.dart';

extension DtoModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(imageUrl: previewURL ?? 'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90');

  }
}