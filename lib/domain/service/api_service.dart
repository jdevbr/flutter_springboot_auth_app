import 'package:auth_app/core/auth/token_service.dart';
import 'package:auth_app/domain/model/token_model.dart';
import 'package:auth_app/base/service/base_service.dart';
import 'package:auth_app/domain/service/auth_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final TokenService _tokenService = TokenService();

  final AuthService _authService = AuthService();

  final BaseService _abstractService = BaseService('api');

  Future<String> getName() async {
    Token token = _tokenService.get();
    http.Response response = await http.get(
      await _abstractService.getUrl('name'),
      headers: token.sendToken(),
    );
    _authService.refreshToken();
    if (response.statusCode == 200) {
      return response.body;
    }
    return 'ERROR';
  }
}
