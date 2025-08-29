import 'package:badiklat/remote/datasources/auth_datasource.dart';

class AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  Future onLogin() async {
    await authDatasource.onLogin();
  }
}
