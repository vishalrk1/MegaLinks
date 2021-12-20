class TutorialModel {
  final String link;
  final String title;
  final String category;

  TutorialModel(
      {required this.link, required this.title, required this.category});

  factory TutorialModel.fromJson(Map<String, dynamic> json) {
    return TutorialModel(
      title: json['title'],
      link: json['link'],
      category: json['category'],
    );
  }
}
