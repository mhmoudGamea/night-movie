import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/search/data/models/search_model/search_model.dart';

import '../../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());

  Future<void> fetchSearchedMovies({required String searchItem}) async {
    emit(SearchLoading());
    var response = await _searchRepo.getSearch(search: searchItem);

    response.fold((failure) {
      emit(SearchFailure(error: failure.errorMessage));
    }, (searchedMovies) {
      emit(SearchSuccess(searchedMovies: searchedMovies));
    });
  }
}
