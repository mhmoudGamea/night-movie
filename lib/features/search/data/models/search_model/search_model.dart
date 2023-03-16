import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String? backdropPath;
  final List<int> genderIds;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const SearchModel({
    this.backdropPath,
    required this.genderIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      backdropPath: json['backdrop_path'],
      genderIds: List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genderIds,
        id,
        overview,
        releaseDate,
        title,
        voteAverage,
      ];
}
