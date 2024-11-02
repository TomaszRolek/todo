part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.users = const [],
    this.status = StateStatus.initial,
    this.error,
  });

  final List<User> users;
  final StateStatus status;
  final String? error;

  DashboardState copyWith({
    List<User>? users,
    StateStatus? status,
    String? error,
  }) {
    return DashboardState(
      users: users ?? this.users,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, users, error];
}
