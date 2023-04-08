part of 'trailer_cubit.dart';

abstract class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

class TrailerInitial extends TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerSuccess extends TrailerState {
  final List<TrailerModel> trailers;
  final bool official;
  const TrailerSuccess({required this.trailers, required this.official});
}

class TrailerFailure extends TrailerState {
  final String error;
  const TrailerFailure({required this.error});
}
