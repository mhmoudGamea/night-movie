// thi smodel used for tvOnTheAirCubit, tvPopularCubit, tvTopRatedCubit,
import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  final String? backdropPath;
  final String firstAirDate;
  final List<dynamic> genreIds;
  final int id;
  final String name;
  final String overview;
  final num voteAverage;

  const TvModel(
      {this.backdropPath,
      required this.firstAirDate,
      required this.genreIds,
      required this.id,
      required this.name,
      required this.overview,
      required this.voteAverage});

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        genreIds: json['genre_ids'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average']);
  }

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        name,
        override,
        voteAverage,
      ];
}
