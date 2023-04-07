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
  const TrailerSuccess({required this.trailers});
}

class TrailerFailure extends TrailerState {
  final String error;
  const TrailerFailure({required this.error});
}
