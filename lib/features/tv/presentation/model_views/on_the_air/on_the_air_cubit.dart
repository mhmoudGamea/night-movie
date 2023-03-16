import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

import '../../../data/models/tv_model.dart';

part 'on_the_air_state.dart';

class OnTheAirCubit extends Cubit<OnTheAirState> {
  final TvRepo _tvRepo;
  OnTheAirCubit(this._tvRepo) : super(OnTheAirInitial());

  Future<void> fetchOnTheAir() async {
    emit(OnTheAirLoading());
    final response = await _tvRepo.getOnTheAir();
    response.fold((failure) {
      emit(OnTheAirFailure(error: failure.errorMessage));
    }, (tvModels) {
      emit(OnTheAirSuccess(tvs: tvModels));
    });
  }
}
