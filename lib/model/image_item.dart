class ImageItem {
  String imageUrl;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => imageUrl.hashCode;

  @override
  String toString() {
    return 'ImageItem{' + ' imageUrl: $imageUrl,' + '}';
  }

  ImageItem copyWith({
    String? imageUrl,
  }) {
    return ImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
    };
  }

  factory ImageItem.fromMap(Map<String, dynamic> map) {
    return ImageItem(
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
