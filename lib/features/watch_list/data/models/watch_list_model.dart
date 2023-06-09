// also i used it to save the movie in watchList of the user in cloud firestore
import 'package:equatable/equatable.dart';

class WatchListModel extends Equatable {
  final String? backdropPath;
  final List<int> generIds;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final String uid;

  const WatchListModel({
    this.backdropPath,
    required this.generIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    this.uid = '',
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      backdropPath: json['backdrop_path'],
      generIds: List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      uid: json['uid'],
    );
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
      'uid': uid,
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
