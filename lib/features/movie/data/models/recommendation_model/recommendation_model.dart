import 'package:equatable/equatable.dart';

class RecommendationModel extends Equatable {
  final String? backdropPath;
  final List<int> generIds;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const RecommendationModel({
    this.backdropPath,
    required this.generIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        backdropPath: json['backdrop_path'],
        generIds: List.from(json['genre_ids'].map((e) => e)),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble());
  }
  @override
  List<Object?> get props => [
        backdropPath,
        generIds,
        id,
        overview,
        releaseDate,
        title,
        voteAverage,
      ];
}
