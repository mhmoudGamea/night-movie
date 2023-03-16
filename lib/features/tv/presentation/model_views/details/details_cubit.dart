import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';

import '../../../data/repos/tv_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final TvRepo _tvRepo;
  DetailsCubit(this._tvRepo) : super(DetailsInitial());

  late TvDetailModel _tvDetailModel;

  TvDetailModel get getTvDetailModel {
    return _tvDetailModel;
  }

  Future<void> fetchDetails(int tvSeriesId) async {
    emit(DetailsLoading());
    final response = await _tvRepo.getTvSeriesDetails(tvSeiesId: tvSeriesId);
    response.fold((failure) {
      emit(DetailsFailure(error: failure.errorMessage));
    }, (seriesDetails) {
      _tvDetailModel = seriesDetails;
      emit(DetailsSuccess(tvDetailModel: seriesDetails));
    });
  }
}
