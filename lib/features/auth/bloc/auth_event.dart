import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterRequested extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String pin;

  const RegisterRequested(this.name, this.phone, this.email, this.password, this.pin);
  // const RegisterRequested(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, phone, email, password, pin];
  // List<Object?> get props => [name, email, password];
}

class LoginRequested extends AuthEvent {
  final String phone;
  final String password;

  // const RegisterRequested(this.name, this.phone, this.email, this.password, this.pin);
  const LoginRequested(this.phone, this.password);

  @override
  // List<Object?> get props => [name, phone, email, password, pin];
  List<Object?> get props => [phone, password];
}
