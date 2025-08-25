import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<LoadHomeData>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        final promos = await repository.fetchPromos();
        final events = await repository.fetchEvents();
        emit(state.copyWith(promos: promos, events: events, loading: false));
      } catch (e) {
        emit(state.copyWith(loading: false, error: e.toString()));
      }
    });
  }
}
