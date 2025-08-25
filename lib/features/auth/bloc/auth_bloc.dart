import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<RegisterRequested>(_onRegisterRequested);
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await authRepository.register(
        name: event.name,
        phone: event.phone,
        email: event.email,
        password: event.password,
        pin: event.pin,
      );

      if (result["success"]) {
        emit(state.copyWith(
          status: AuthStatus.success,
          message: "Register berhasil",
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: result["message"],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        message: "Terjadi kesalahan: $e",
      ));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await authRepository.login(
        phone: event.phone,
        password: event.password,
      );

      if (result["success"]) {
        emit(state.copyWith(
          status: AuthStatus.success,
          message: "Login berhasil",
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: result["message"],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        message: "Terjadi kesalahan: $e",
      ));
    }
  }
}
