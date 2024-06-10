import 'package:injectable/injectable.dart';
import 'package:playground/core/services/endpoints.dart';
import 'package:playground/data/models/users_api_response.dart';
import 'package:playground/data/services/api_service.dart';
import 'package:playground/domain/contracts/users_api.dart';

@LazySingleton(as: UsersApi)
class UsersApiImpl extends UsersApi {
  final ApiService _apiService;

  UsersApiImpl(this._apiService);

  @override
  Future<UsersApiResponse> getUsers() async {
    try {
      final response = await _apiService.get(Endpoints.users);
      return UsersApiResponse.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
  
  @override
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> data) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> data) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}