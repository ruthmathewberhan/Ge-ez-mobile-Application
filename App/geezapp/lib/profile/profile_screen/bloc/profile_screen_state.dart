import 'package:equatable/equatable.dart';
import '../profile_screen.dart';

class ProfileScreenState extends Equatable {
  const ProfileScreenState();

  @override
  List<Object> get props => [];
}

class ProfileScreenLoading extends ProfileScreenState {}

class ProfileScreenLoadSuccess extends ProfileScreenState {
  final List<ProfileScreen> profileScreen;

  ProfileScreenLoadSuccess([this.profileScreen = const []]);

  @override
  List<Object> get props => [profileScreen];
}

class ProfileScreenOperationFailure extends ProfileScreenState {}
