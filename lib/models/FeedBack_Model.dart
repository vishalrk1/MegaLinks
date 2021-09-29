class FeedBackModel {
  final String name;
  final String feedBack;
  final String bug;

  FeedBackModel({this.name, this.feedBack, this.bug});

  factory FeedBackModel.fromJson(Map<String, dynamic> json) {
    return FeedBackModel(
      name: json['name'],
      feedBack: json['feedback'],
      bug: json['bug'],
    );
  }
}
