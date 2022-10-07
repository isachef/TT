import 'package:technical_task/screens/first_screen/bloc/user_provider.dart';

import '../../../models/user_model.dart';

class UserRepository {
  UserProvider provider = UserProvider();

  Future<List<UserModel>> getUsers() {
    return provider.getUsers('/users');
  }
}
