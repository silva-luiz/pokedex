import 'package:dio/dio.dart';

class UserRegisterDatasource {
  final Dio _client = Dio();

  Future<Map<String, dynamic>> registerUser(String userEmail, String userPassword) async {
    const String firebaseApiKey = 'YOUR_FIREBASE_API_KEY'; // Substitua pela sua API Key do Firebase
    final String url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey';

    try {
      final response = await _client.post(
        url,
        data: {
          'email': userEmail,
          'password': userPassword,
          'returnSecureToken': true,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception('An error occurred during user registration: $e');
    }
  }
}
