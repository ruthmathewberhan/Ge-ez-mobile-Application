import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProfileScreen extends Equatable {
  ProfileScreen(
      {required this.email,
      required this.firstName,
      required this.secondName,
      required this.password,
      required this.userType,
      required this.photo});

  final String email;
  final String firstName;
  final String secondName;
  final String password;
  final String userType;
  final String photo;

  @override
  List<Object> get props => [email, firstName, secondName, password, userType, photo];

  factory ProfileScreen.fromJson(Map<String, dynamic> json) {
    return ProfileScreen(
      email: json['email'] ?? "",
        password: json['password'] ?? "",
        firstName: json['firstName'] ?? "",
        secondName: json['secondName'] ?? "",
        userType: json['userType'] ?? "",
        photo: json['photo'] ?? "");
   
  }

  @override
  String toString() => 'Course { email: $email, password: $password, firstName: $firstName }';
}
