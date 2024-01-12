class SupportCardModel {
  final String imagePath;
  final String title;
  final String description;
  bool isActive;

  SupportCardModel({
    required this.description,
    required this.imagePath,
    required this.title,
    this.isActive = false,
  });
}
