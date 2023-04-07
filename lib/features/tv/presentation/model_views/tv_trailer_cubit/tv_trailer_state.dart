part of 'tv_trailer_cubit.dart';

abstract class TvTrailerState extends Equatable {
  const TvTrailerState();

  @override
  List<Object> get props => [];
}

class TvTrailerInitial extends TvTrailerState {}

class TvTrailerLoading extends TvTrailerState {}

class TvTrailerSuccess extends TvTrailerState {
  final List<TrailerModel> trailers;
  const TvTrailerSuccess({required this.trailers});
}

class TvTrailerFailure extends TvTrailerState {
  final String error;
  const TvTrailerFailure({required this.error});
}
