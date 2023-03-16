// when you click on episode this will show the details of it. DetailsCubit
import 'package:equatable/equatable.dart';

class TvDetailModel extends Equatable {
  final String? backdropPath;
  final List<dynamic> eposideRunTime;
  final String firstAirDate;
  final List<Map<String, dynamic>> geners;
  final String homePage;
  final int id;
  final String name;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final String overview;
  final double voteAverage;

  const TvDetailModel({
    this.backdropPath,
    required this.eposideRunTime,
    required this.firstAirDate,
    required this.geners,
    required this.homePage,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
  });

  factory TvDetailModel.fromJson(Map<String, dynamic> json) {
    return TvDetailModel(
      backdropPath: json['backdrop_path'],
      eposideRunTime: json['episode_run_time'],
      firstAirDate: json['first_air_date'],
      geners: List.from(json['genres']),
      homePage: json['homepage'],
      id: json['id'],
      name: json['name'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        eposideRunTime,
        firstAirDate,
        geners,
        homePage,
        id,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        overview,
        voteAverage,
      ];
}
