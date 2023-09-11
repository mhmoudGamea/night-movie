class ConfigModel {
  final String apiKey;
  final String baseUrl;
  final String baseImageUrl;

  ConfigModel({
    required this.apiKey,
    required this.baseUrl,
    required this.baseImageUrl,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> map) {
    return ConfigModel(
      apiKey: map['api_key'],
      baseUrl: map['base_url'],
      baseImageUrl: map['base_image_url'],
    );
  }
}
