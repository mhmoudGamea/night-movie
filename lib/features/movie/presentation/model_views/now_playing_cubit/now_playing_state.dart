part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final List<MovieModel> movies;
  const NowPlayingSuccess({required this.movies});
}

class NowPlayingFailure extends NowPlayingState {
  final String error;
  const NowPlayingFailure({required this.error});
}
