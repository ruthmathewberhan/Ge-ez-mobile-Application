import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Signup extends Equatable {
  Signup(
      {required this.email,
      required this.firstName,
      required this.secondName,
      required this.password,
      required this.userType,
      this.photo = "www/google.com"});

  final String email;
  final String password;
  final String firstName;
  final String secondName;
  final String userType;
  final String photo;

  @override
  List<Object> get props => [email, password];

  factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(email: json['email'] ?? "",
        password: json['password'] ?? "",
        firstName: json['firstName'] ?? "",
        secondName: json['secondName'] ?? "",
        userType: json['userType'] ?? "",
        photo: json['photo'] ?? "");
  }

  @override
  String toString() => 'Signup { email: $email, password: $password, firstName: $firstName, secondName: $secondName, userType: $userType, photo: $photo}';
}
