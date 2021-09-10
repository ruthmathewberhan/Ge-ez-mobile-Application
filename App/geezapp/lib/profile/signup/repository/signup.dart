import 'package:meta/meta.dart';
import '../signup.dart';

import '../signup.dart';

class SignupRepository {
  final SignupDataProvider dataProvider;

  SignupRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<Signup> createSignup(Signup signup) async {
    return await dataProvider.createSignup(signup);
  }
  Future<List<Signup>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }
}
