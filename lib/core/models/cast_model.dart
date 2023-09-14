class CastModel {
  final String? actorProfilePath;
  final String? actorName;

  CastModel({required this.actorProfilePath, required this.actorName});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      actorProfilePath: json['profile_path'] ?? '',
      actorName: json['name'] ?? 'Un known',
    );
  }

  static List<CastModel> getCast(Map<String, dynamic> json) {
    List<CastModel> cast = [];
    json['cast'].forEach((element) {
      cast.add(CastModel.fromJson(element));
    });
    return cast;
  }
}
