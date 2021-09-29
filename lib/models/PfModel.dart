class PfModel {
  final String title;
  final String pfLink;
  final String editLink;
  final String credit;
  final String category;

  PfModel({
    this.title,
    this.pfLink,
    this.editLink,
    this.credit,
    this.category,
  });

  factory PfModel.fromJson(Map<String, dynamic> json) {
    return PfModel(
      title: json['title'],
      pfLink: json['pflink'],
      editLink: json['editlink'],
      credit: json['credit'],
      category: json['category'],
    );
  }
}
