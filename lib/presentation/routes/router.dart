import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/core/di/injectable.dart';
import 'package:playground/domain/repositories/user_repository.dart';
import 'package:playground/presentation/pages/home/bloc/home_bloc.dart';
import 'package:playground/presentation/pages/home/home_page.dart';
import 'package:playground/presentation/pages/login/login_page.dart';
import 'package:playground/presentation/routes/path.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Path.home,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeBloc(
            userRepository: getIt.get<UserRepository>(),
          )..add(const UsersRequested()),
          child: HomePage(
            key: state.pageKey,
          ),
        );
      },
    ),
    GoRoute(
      path: Path.login,
      builder: (context, state) => LoginPage(key: state.pageKey),
    ),
  ],
);
