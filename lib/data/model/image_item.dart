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
  }

//</editor-fold>
}