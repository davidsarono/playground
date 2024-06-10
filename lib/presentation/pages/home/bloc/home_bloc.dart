import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:playground/domain/entities/user.dart';
import 'package:playground/domain/repositories/user_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required UserRepository userRepository,
  }) : _userRepository = userRepository, super(const HomeState()) {
    on<UsersRequested>(_onUsersRequested);
  }

  final UserRepository _userRepository;

  Future<void> _onUsersRequested(
    UsersRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final users = await _userRepository.getUsers();
      emit(state.copyWith(status: HomeStatus.success, users: users));
    } catch (error) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
