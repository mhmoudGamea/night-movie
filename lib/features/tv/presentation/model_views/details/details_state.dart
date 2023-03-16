part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final TvDetailModel tvDetailModel;
  const DetailsSuccess({required this.tvDetailModel});
}

class DetailsFailure extends DetailsState {
  final String error;
  const DetailsFailure({required this.error});
}
