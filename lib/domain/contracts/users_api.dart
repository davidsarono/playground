import 'package:playground/data/models/users_api_response.dart';

abstract class UsersApi {
  Future<UsersApiResponse> getUsers();
  Future<Map<String, dynamic>> getUser(String id);
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> data);
  Future<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> data);
  Future<Map<String, dynamic>> deleteUser(String id);
}