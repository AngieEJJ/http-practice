class ImageItem {
  String imageUrl;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      imageUrl: map['imageUrl'] as String,
    );
  } // 똑같은 이 형태의 객체를 계속 찍어낸다.

//</editor-fold>
}