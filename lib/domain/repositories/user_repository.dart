import 'package:injectable/injectable.dart';
import 'package:playground/domain/contracts/users_api.dart';
import 'package:playground/domain/entities/user.dart';
import 'package:playground/domain/mappers/user_mapper.dart';

@injectable
class UserRepository {
  final UsersApi _usersApi;
  final UserMapper _userMapper;

  UserRepository(
    this._usersApi,
    this._userMapper,
  );

  Future<List<User>> getUsers() async {
    var response = await _usersApi.getUsers();
    return _userMapper.convertList(response.data);
  }
}
