import '../dto/pixabay_dto.dart';
import '../model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(imageUrl: previewURL ?? '');
  }
}