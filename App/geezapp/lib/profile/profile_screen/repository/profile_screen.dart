import 'package:meta/meta.dart';
import '../profile_screen.dart';

class ProfileScreenRepository {
  final ProfileScreenDataProvider dataProvider;

  ProfileScreenRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<List<ProfileScreen>> getProfile() async {
    return await dataProvider.getProfile();
  }

  Future<void> deleteProfile() async {
    await dataProvider.deleteProfile();
  }
}
