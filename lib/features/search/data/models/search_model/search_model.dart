import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String? backdropPath;
  final List<int>? generIds;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final String? mediaType;

  const SearchModel({
    this.backdropPath,
    this.generIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    this.mediaType,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      backdropPath: json['backdrop_path'],
      generIds: List.from(json['genre_ids']),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      mediaType: json['media_type'],
    );
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
        mediaType,
      ];
}
