import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/data/models/users_api_response.dart';
import 'package:playground/domain/entities/user.dart';

import 'user_mapper.auto_mappr.dart';

@injectable
@AutoMappr([
  MapType<UserItemApi, User>(),
])
class UserMapper extends $UserMapper {}