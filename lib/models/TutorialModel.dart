class TutorialModel {
  final String link;
  final String title;
  final String category;

  TutorialModel({this.link, this.title, this.category});

  factory TutorialModel.fromJson(Map<String, dynamic> json) {
    return TutorialModel(
      title: json['title'],
      link: json['link'],
      category: json['category'],
    );
  }
}
