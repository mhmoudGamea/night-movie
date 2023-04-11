part of 'watch_list_cubit.dart';

abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

class WatchListInitial extends WatchListState {}

class WatchListGetLoading extends WatchListState {}

class WatchListGetSuccess extends WatchListState {
  final List<MovieModel> watch;
  const WatchListGetSuccess({required this.watch});
}

class WatchListGetFailure extends WatchListState {
  final String error;
  const WatchListGetFailure({required this.error});
}
