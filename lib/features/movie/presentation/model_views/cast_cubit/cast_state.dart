part of 'cast_cubit.dart';

class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccess extends CastState {
  final List<CastModel> cast;
  const CastSuccess({required this.cast});
}

class CastFailure extends CastState {
  final String error;

  const CastFailure({required this.error});
}
