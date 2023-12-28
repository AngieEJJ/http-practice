class ContentItem {
  String imageUrl;

//<editor-fold desc="Data Methods">
  ContentItem({
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentItem &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => imageUrl.hashCode;

  @override
  String toString() {
    return 'ContentItem{' + ' imageUrl: $imageUrl,' + '}';
  }

  ContentItem copyWith({
    String? imageUrl,
  }) {
    return ContentItem(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
    };
  }

  factory ContentItem.fromMap(Map<String, dynamic> map) {
    return ContentItem(
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}