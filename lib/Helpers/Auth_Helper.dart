import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  signUp(String email, String name, String password,
      String confirmPassword) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlOTFkZTZiOC1lZGEzLTRhNWYtOTViZC02ODQ4MjE4OTUyMTMiLCJpYXQiOjE2ODEyMTg0MzIsImV4cCI6MTY4MzgxMDQzMn0.Ysf4eyK6DyS3kj1DPKOiooLzxMkjyreNuygFoZgui44'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://todo-api.yooums.repl.co/auth/signup'));
    request.fields.addAll({
      'email': email,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    }
  }
}
