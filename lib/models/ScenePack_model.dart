class ScenePackModel {
  String title;
  String image;
  String link;
  String credit;

  ScenePackModel({
    this.title,
    this.image,
    this.link,
    this.credit,
  });

  factory ScenePackModel.fromJson(Map<String, dynamic> json) {
    return ScenePackModel(
      title: json['title'] ?? 'Not Available',
      image: json['image'] ??
          'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
      link: json['link'],
      credit: json['credit'] ?? 'None',
    );
  }
}
