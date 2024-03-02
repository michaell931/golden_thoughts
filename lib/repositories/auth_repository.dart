import 'dart:async';

import 'package:golden_thoughts/data_sources/auth_data_source.dart';
import 'package:golden_thoughts/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  AuthRepository({required this.authDataSource});
  final AuthDataSource authDataSource;

  Future<void> signOut() async {
    authDataSource.signOut();
  }

  Stream<UserModel?> authenticationCheck() {
    return authDataSource.authenticationCheck().map((user) {
      if (user == null) {
        return null;
      }
      return UserModel(id: user.id, name: user.name);
    });
  }
}
