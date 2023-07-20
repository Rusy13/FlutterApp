import 'package:postgres/postgres.dart';
import 'package:flutter_pr1/repositories/services/database_connection.dart';

Future<void> registerUser(String email, String username, String password) async {
  final connection = await getConnection();

  try {
    await connection.query(
      'INSERT INTO users (email, username, password) VALUES (@email, @username, @password)',
      substitutionValues: {
        'email': email,
        'username': username,
        'password': password,
      },
    );

    print('User registered successfully');
  } catch (e) {
    print('Error registering user: $e');
  } finally {
    await connection.close();
  }
}
