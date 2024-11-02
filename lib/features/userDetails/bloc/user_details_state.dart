part of 'user_details_bloc.dart';


class UserDetailsState extends Equatable {
  const UserDetailsState({
    this.user,
    this.status = StateStatus.initial,
    this.taskStatus = StateStatus.initial,
    this.addTaskStatus = StateStatus.initial,
    this.error,
    this.userTasks = const [],
  });

  final UserDetails? user;
  final StateStatus status;
  final StateStatus taskStatus;
  final StateStatus addTaskStatus;
  final String? error;
  final List<Task> userTasks;

  UserDetailsState copyWith({
    UserDetails? user,
    StateStatus? status,
    StateStatus? taskStatus,
    StateStatus? addTaskStatus,
    String? error,
    List<Task>? userTasks,
  }) {
    return UserDetailsState(
      user: user ?? this.user,
      status: status ?? this.status,
      taskStatus: taskStatus ?? this.taskStatus,
      addTaskStatus: addTaskStatus ?? this.addTaskStatus,
      error: error,
      userTasks: userTasks ?? this.userTasks,
    );
  }

  @override
  List<Object?> get props => [status, taskStatus, user, error, userTasks, addTaskStatus];
}
