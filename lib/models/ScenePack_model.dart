class ScenePackModel {
  final String title;
  final String image;
  final String link;
  final String credit;

  ScenePackModel({
    this.title,
    this.image,
    this.link,
    this.credit,
  });

  factory ScenePackModel.fromJson(Map<String, dynamic> json) {
    return ScenePackModel(
      title: json['title'],
      image: json['image'],
      link: json['link'],
      credit: json['credit'],
    );
  }
}
