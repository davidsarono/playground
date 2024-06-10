import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:playground/core/services/api_service_impl.dart';
import 'package:playground/core/services/endpoints.dart';
import 'package:playground/data/services/api/users_api_impl.dart';
import 'package:playground/domain/entities/user.dart';
import 'package:playground/domain/mappers/user_mapper.dart';
import 'package:playground/domain/repositories/user_repository.dart';

void main() {
  group('UserRepository', () {
    test('should return a list of users', () async {
      // Arrange
      final response = {
        "page": 1,
        "per_page": 6,
        "total": 12,
        "total_pages": 2,
        "data": [
          {
            "id": 1,
            "email": "george.bluth@reqres.in",
            "first_name": "George",
            "last_name": "Bluth",
            "avatar": "https://reqres.in/img/faces/1-image.jpg"
          },
          {
            "id": 2,
            "email": "janet.weaver@reqres.in",
            "first_name": "Janet",
            "last_name": "Weaver",
            "avatar": "https://reqres.in/img/faces/2-image.jpg"
          },
        ],
      };
      final dio = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: dio);
      final apiService = ApiServiceImpl(dioAdapter.dio);
      final usersApiService = UsersApiImpl(apiService);
      dioAdapter.onGet(
        Endpoints.users,
        (request) => request.reply(
          200,
          response,
          delay: const Duration(seconds: 1),
        ),
      );
      final userMapper = UserMapper();
      final userRepository = UserRepository(usersApiService, userMapper);
      // Act
      final result = await userRepository.getUsers();
      // Assert
      expect(result, isA<List<User>>());
    });
  });
}