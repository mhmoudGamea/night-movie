// this model used for multi search which mean u can search about movie or tv series
// so if the result was movie[title, releaseDate]
// so if the result was tv[name, firstAirDate]

import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String? backdropPath;
  final List<int>? generIds;
  final int id;
  final String? overview;
  final String? releaseDate;
  final String? firstAirDate;
  final String? title;
  final String? name;
  final double voteAverage;
  final String? mediaType;

  const SearchModel({
    this.backdropPath,
    this.generIds,
    required this.id,
    this.overview,
    this.releaseDate,
    this.firstAirDate,
    required this.title,
    required this.name,
    required this.voteAverage,
    this.mediaType,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      backdropPath: json['backdrop_path'],
      generIds: List.from(json['genre_ids'] ?? []),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      title: json['title'],
      name: json['name'],
      voteAverage:
          json['vote_average'] == null ? 0 : json['vote_average'].toDouble(),
      mediaType: json['media_type'],
    );
  }

  static List<SearchModel> getListFromResponse(Map<String, dynamic> response) {
    List<SearchModel> searchedItems = [];
    response['results'].forEach(
      (item) => {
        searchedItems.add(
          SearchModel.fromJson(item),
        ),
      },
    );
    return searchedItems;
  }

  @override
  List<Object?> get props => [
        backdropPath,
        generIds,
        id,
        overview,
        releaseDate,
        firstAirDate,
        title,
        name,
        voteAverage,
        mediaType,
      ];
}
