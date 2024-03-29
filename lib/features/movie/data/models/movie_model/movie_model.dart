// used for now playing, popular and top rated
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final String? backdropPath;
  final List<int> generIds;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const MovieModel({
    this.backdropPath,
    required this.generIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      generIds: List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  factory MovieModel.fromFirestore(QueryDocumentSnapshot<Object?> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      generIds: List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  static List<MovieModel> getListFromResponse(Map<String, dynamic> response) {
    List<MovieModel> movieList = [];
    response['results']
        .forEach((data) => movieList.add(MovieModel.fromJson(data)));
    return movieList;
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'genre_ids': generIds,
      'id': id,
      'overview': overview,
      'release_date': releaseDate,
      'title': title,
      'vote_average': voteAverage,
    };
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
