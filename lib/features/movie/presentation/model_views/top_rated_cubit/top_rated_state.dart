part of 'top_rated_cubit.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedMoviesLoading extends TopRatedState {}

class TopRatedMoviesSuccess extends TopRatedState {
  final List<MovieModel> movies;
  const TopRatedMoviesSuccess({required this.movies});
}

class TopRatedMoviesFailure extends TopRatedState {
  final String error;
  const TopRatedMoviesFailure({required this.error});
}

// pagination states
class TopRatedMoviesPaginationLoading extends TopRatedState {}
