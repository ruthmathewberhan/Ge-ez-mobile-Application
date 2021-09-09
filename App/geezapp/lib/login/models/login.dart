import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Login extends Equatable {
  Login(
      {required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(email: json['email'] ?? "", password: json['password'] ?? ""
    );
  }

  @override
  String toString() => 'Login { email: $email, code: $password}';
}
