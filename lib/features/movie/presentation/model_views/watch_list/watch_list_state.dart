part of 'watch_list_cubit.dart';

abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

class WatchListInitial extends WatchListState {}

// if user select movie to be added to it's watch list
class WatchListSuccess extends WatchListState {}

class WatchListFailure extends WatchListState {}

// movies ids
class GetWatchListIdsSuccess extends WatchListState {}

class RemoveWatchListIdsSuccess extends WatchListState {}
