part of 'recommendation_cubit.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationSuccess extends RecommendationState {
  final List<RecommendationModel> recommendations;
  const RecommendationSuccess({required this.recommendations});
}

class RecommendationFailure extends RecommendationState {
  final String error;
  const RecommendationFailure({required this.error});
}
