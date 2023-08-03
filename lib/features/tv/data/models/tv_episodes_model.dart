// thismodel used for tvEpisodesCubit (episodes in each season),
import 'package:equatable/equatable.dart';

class TvEpisodeModel extends Equatable {
  final String airDate;
  final int? episodeNumber;
  final String name;
  final String overview;
  final int? runTime;
  final String? stillPath;
  final dynamic voteAverage;

  const TvEpisodeModel({
    required this.airDate,
    this.episodeNumber,
    required this.name,
    required this.overview,
    this.runTime,
    this.stillPath,
    required this.voteAverage,
  });

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeModel(
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      name: json['name'],
      overview: json['overview'],
      runTime: json['runtime'],
      stillPath: json['still_path'],
      voteAverage: json['vote_average'],
    );
  }

  static List<TvEpisodeModel> getListFromResponse(
      Map<String, dynamic> response) {
    List<TvEpisodeModel> tvEposideList = [];
    response['results']
        .forEach((data) => tvEposideList.add(TvEpisodeModel.fromJson(data)));
    return tvEposideList;
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        name,
        overview,
        runTime,
        stillPath,
        voteAverage,
      ];
}
