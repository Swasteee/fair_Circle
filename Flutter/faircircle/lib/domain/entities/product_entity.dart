class ProductEntity {
  final String title;
  final String imagePath;

  const ProductEntity({
    required this.title,
    required this.imagePath,
  });

  // Optional: Equatable-like equality for value comparison (for testing, etc.)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          imagePath == other.imagePath;

  @override
  int get hashCode => title.hashCode ^ imagePath.hashCode;
}
