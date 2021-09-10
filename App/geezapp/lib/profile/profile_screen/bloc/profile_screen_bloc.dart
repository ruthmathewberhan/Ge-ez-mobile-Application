import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc.dart';
import '../profile.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final ProfileScreenRepository profileScreenRepository;

  ProfileScreenBloc({required this.profileScreenRepository})
      : assert(profileScreenRepository != null),
        super(ProfileScreenLoading());

  @override
  Stream<ProfileScreenState> mapEventToState(ProfileScreenEvent event) async* {
    if (event is ProfileScreenLoad) {
      yield ProfileScreenLoading();
      try {
        final courses = await profileScreenRepository.getProfile();
        yield ProfileScreenLoadSuccess(courses);
      } catch (_) {
        yield ProfileScreenOperationFailure();
      }
    }


    if (event is ProfileScreenDelete) {
      try {
        await profileScreenRepository.deleteProfile();
        final courses = await profileScreenRepository.getProfile();
        yield ProfileScreenLoadSuccess(courses);
      } catch (_) {
        yield ProfileScreenOperationFailure();
      }
    }
  }
}
