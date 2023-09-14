import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/show_web_view.dart';
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

  void tvWebView({
    required BuildContext context,
    required bool isValidUrl,
    required String url,
  }) {
    if (!isValidUrl) {
      Helper.showToast(
          context: context,
          color: Colors.amber,
          icon: FontAwesomeIcons.triangleExclamation,
          message: 'Sorry the url of this series is not provided yet!');
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShowWebView(url: url),
        ),
      );
    }
  }
}
