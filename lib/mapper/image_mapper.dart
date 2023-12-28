import 'package:practice_image_search/dto/pixabay_dto.dart';
import 'package:practice_image_search/model/content_item.dart';

extension DtoModel on Hits {
  ContentItem toImageItem() {
    return ContentItem(imageUrl: previewURL ?? '');

  }
}

// mapper: 데이터나 객체를 다른 형태로 변환하는 함수 또는 클래스
// Hits 클래스를 만들어둔 모델 클래스로 변환하는 toImageItem 메서드를 정의