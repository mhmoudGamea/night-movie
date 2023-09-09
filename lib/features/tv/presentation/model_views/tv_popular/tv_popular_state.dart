part of 'tv_popular_cubit.dart';

abstract class TvPopularState extends Equatable {
  const TvPopularState();

  @override
  List<Object> get props => [];
}

class TvPopularInitial extends TvPopularState {}

class TvPopularLoading extends TvPopularState {}

class TvPopularSuccess extends TvPopularState {
  final List<TvModel> tvs;
  const TvPopularSuccess({required this.tvs});
}

class TvPopularFailure extends TvPopularState {
  final String error;
  const TvPopularFailure({required this.error});
}

// pagination states
class TvPopularPaginationLoading extends TvPopularState {}
