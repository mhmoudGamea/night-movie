part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchModel> searchedMovies;
  const SearchSuccess({required this.searchedMovies});
}

class SearchFailure extends SearchState {
  final String error;
  const SearchFailure({required this.error});
}
