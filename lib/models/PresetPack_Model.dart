class PresetPackModel {
  final String packName;
  final String software;
  final String payhipLink;
  final String igImage;
  final String contains;
  final String instagramId;
  final String price;
  final String category;

  PresetPackModel({
    required this.packName,
    required this.software,
    required this.contains,
    required this.igImage,
    required this.instagramId,
    required this.payhipLink,
    required this.price,
    required this.category,
  });

  factory PresetPackModel.fromJson(Map<String, dynamic> json) {
    return PresetPackModel(
      packName: json['packName'],
      software: json['software'],
      payhipLink: json['payhipLink'],
      instagramId: json['InstagramId'],
      igImage: json['igImage'],
      contains: json['contains'],
      price: json['price'],
      category: json['category'],
    );
  }
}
