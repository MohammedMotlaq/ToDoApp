import 'package:http/http.dart' as http;

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  
  signUp(String email, String name, String password,
      String confirmPassword) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://todo-api.yooums.repl.co/auth/signup'));
    request.fields.addAll({
      'email': email,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword
    });
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    }
  }
}
