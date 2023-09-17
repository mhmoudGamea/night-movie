part of 'tv_cast_cubit.dart';

class TvCastState extends Equatable {
  const TvCastState();

  @override
  List<Object> get props => [];
}

class TvCastInitial extends TvCastState {}

class TvCastLoading extends TvCastState {}

class TvCastSuccess extends TvCastState {
  final List<CastModel> cast;
  const TvCastSuccess({required this.cast});
}

class TvCastFailure extends TvCastState {
  final String error;
  const TvCastFailure({required this.error});
}
