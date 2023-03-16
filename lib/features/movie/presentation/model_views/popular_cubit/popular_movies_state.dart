part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieModel> movies;
  const PopularMoviesSuccess({required this.movies});
}

class PopularMoviesFailure extends PopularMoviesState {
  final String error;
  const PopularMoviesFailure({required this.error});
}
