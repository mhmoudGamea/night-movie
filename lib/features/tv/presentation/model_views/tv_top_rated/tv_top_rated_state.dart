part of 'tv_top_rated_cubit.dart';

abstract class TvTopRatedState extends Equatable {
  const TvTopRatedState();

  @override
  List<Object> get props => [];
}

class TvTopRatedInitial extends TvTopRatedState {}

class TvTopRatedLoading extends TvTopRatedState {}

class TvTopRatedSuccess extends TvTopRatedState {
  final List<TvModel> tvs;
  const TvTopRatedSuccess({required this.tvs});
}

class TvTopRatedFailure extends TvTopRatedState {
  final String error;
  const TvTopRatedFailure({required this.error});
}
