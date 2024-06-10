part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.users = const <User>[],
  });

  final HomeStatus status;
  final List<User> users;

  HomeState copyWith({
    HomeStatus? status,
    List<User>? users,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [
        status,
        users,
      ];
}
