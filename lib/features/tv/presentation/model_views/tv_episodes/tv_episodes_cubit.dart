import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/tv/data/models/tv_episodes_model.dart';
import 'package:night_movie/features/tv/data/models/tv_model.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

part 'tv_episodes_state.dart';

class TvEpisodesCubit extends Cubit<TvEpisodesState> {
  final TvRepo _tvRepo;
  TvEpisodesCubit(this._tvRepo) : super(TvEpisodesInitial());

  List<TvEpisodeModel> _tvEpisodes = [];

  List<TvEpisodeModel> get getTvEpisodes {
    return [..._tvEpisodes];
  }

  var _seasonsTab = true;
  var _moreLikeThisTab = false;

  void changeSeasonsTabValue() {
    _seasonsTab = true;
    _moreLikeThisTab = false;
    emit(TvSeasonsTabMode());
  }

  void changeMoreLikeThisTabValue({required int tvId}) {
    _moreLikeThisTab = true;
    _seasonsTab = false;
    emit(TvMoreLikeThisTabMode());
    fetchRecommendation(tvId: tvId);
  }

  bool get getSeasonsTabValue {
    return _seasonsTab;
  }

  bool get getMoreLikeThisTabValue {
    return _moreLikeThisTab;
  }

  Future<void> fetchRecommendation({required int tvId}) async {
    emit(TvRecommendationLoading());
    var response = await _tvRepo.getTvRecommendations(tvId: tvId);

    response.fold((failure) {
      emit(TvRecommendationFailure(error: failure.errorMessage));
    }, (recommendations) {
      emit(TvRecommendationSuccess(recommendations: recommendations));
    });
  }

  Future<void> fetchEpisodes(int tvId, int seasonnumber) async {
    emit(TvEpisodesLoading());
    final response =
        await _tvRepo.getEpisodes(tvId: tvId, seasonNumber: seasonnumber);
    response.fold(
      (failure) {
        emit(TvEpisodesFailure(error: failure.errorMessage));
      },
      (tvEpisodes) {
        _tvEpisodes = tvEpisodes;
        emit(TvEpisodesSuccess(tvEpisodes: tvEpisodes));
      },
    );
  }
}
