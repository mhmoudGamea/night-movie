part of 'on_the_air_cubit.dart';

abstract class OnTheAirState extends Equatable {
  const OnTheAirState();

  @override
  List<Object> get props => [];
}

class OnTheAirInitial extends OnTheAirState {}

class OnTheAirLoading extends OnTheAirState {}

class OnTheAirSuccess extends OnTheAirState {
  final List<TvModel> tvs;
  const OnTheAirSuccess({required this.tvs});
}

class OnTheAirFailure extends OnTheAirState {
  final String error;
  const OnTheAirFailure({required this.error});
}
