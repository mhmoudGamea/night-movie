part of 'tv_episodes_cubit.dart';

abstract class TvEpisodesState extends Equatable {
  const TvEpisodesState();

  @override
  List<Object> get props => [];
}

class TvEpisodesInitial extends TvEpisodesState {}

class TvEpisodesExpanded extends TvEpisodesState {}

class TvEpisodesLoading extends TvEpisodesState {}

class TvEpisodesSuccess extends TvEpisodesState {
  final List<TvEpisodeModel> tvEpisodes;
  const TvEpisodesSuccess({required this.tvEpisodes});
}

class TvEpisodesFailure extends TvEpisodesState {
  final String error;
  const TvEpisodesFailure({required this.error});
}

class TvSeasonsTabMode extends TvEpisodesState {}

class TvMoreLikeThisTabMode extends TvEpisodesState {}

class TvRecommendationLoading extends TvEpisodesState {}

class TvRecommendationSuccess extends TvEpisodesState {
  final List<TvModel> recommendations;
  const TvRecommendationSuccess({required this.recommendations});
}

class TvRecommendationFailure extends TvEpisodesState {
  final String error;
  const TvRecommendationFailure({required this.error});
}
