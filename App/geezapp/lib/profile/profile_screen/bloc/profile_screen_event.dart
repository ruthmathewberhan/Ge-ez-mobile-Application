import 'package:equatable/equatable.dart';
import '../profile_screen.dart';

abstract class ProfileScreenEvent extends Equatable {
  const ProfileScreenEvent();
}

class ProfileScreenLoad extends ProfileScreenEvent {
  const ProfileScreenLoad();

  @override
  List<Object> get props => [];
}

class ProfileScreenDelete extends ProfileScreenEvent {

  const ProfileScreenDelete();

  @override
  List<Object> get props => [];

  @override
  toString() => 'Profile Deleted';
}
