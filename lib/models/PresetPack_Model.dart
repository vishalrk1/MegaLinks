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
    this.packName,
    this.software,
    this.contains,
    this.igImage,
    this.instagramId,
    this.payhipLink,
    this.price,
    this.category,
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
