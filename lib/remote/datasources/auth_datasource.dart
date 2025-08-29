import 'package:badiklat/core/services/http.service.dart';

class AuthDatasource {
  final HttpService httpService;

  AuthDatasource(this.httpService);

  Future onLogin() async {
    //make http call
    // final response = await httpService.dio.post('/login');
    // return response.data;

    print("From datasource");
  }
}
