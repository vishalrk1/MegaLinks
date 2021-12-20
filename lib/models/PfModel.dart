class PfModel {
  final String title;
  final String pfLink;
  final String editLink;
  final String credit;
  final String category;

  PfModel({
    required this.title,
    required this.pfLink,
    required this.editLink,
    required this.credit,
    required this.category,
  });

  factory PfModel.fromJson(Map<String, dynamic> json) {
    return PfModel(
      title: json['title'],
      pfLink: json['pflink'],
      editLink: json['editlink'],
      credit: json['credit'] ?? 'unknown',
      category: json['category'] ?? 'After Effects',
    );
  }
}
