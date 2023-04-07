import 'package:equatable/equatable.dart';

class TrailerModel extends Equatable {
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;

  const TrailerModel({
    required this.name,
    required this.key,
    required this.size,
    required this.site,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      name: json['name'],
      key: json['key'],
      size: json['size'],
      site: json['site'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
    );
  }
  @override
  List<Object?> get props => [
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
      ];
}
