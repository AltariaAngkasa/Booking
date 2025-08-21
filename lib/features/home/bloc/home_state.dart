import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<String> promos;
  final List<String> events;
  final bool loading;
  final String? error;

  const HomeState({
    this.promos = const [],
    this.events = const [],
    this.loading = false,
    this.error,
  });

  HomeState copyWith({
    List<String>? promos,
    List<String>? events,
    bool? loading,
    String? error,
  }) {
    return HomeState(
      promos: promos ?? this.promos,
      events: events ?? this.events,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [promos, events, loading, error];
}
