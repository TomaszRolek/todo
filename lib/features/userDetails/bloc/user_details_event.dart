part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends UserDetailsEvent {
  final int userId;
  final String order;
  final String sortBy;
  final bool initialLoad;
  final int page;
  final String? filter;

  const LoadDataEvent({
    required this.userId,
    this.sortBy = 'name',
    this.order = 'asc',
    this.initialLoad = true,
    this.page = 1,
    this.filter,
  });

  @override
  List<Object> get props => [userId, order, sortBy, initialLoad, page];
}

class AddTaskEvent extends UserDetailsEvent {
  final int userId;
  final String description;

  const AddTaskEvent({required this.userId, required this.description});

  @override
  List<Object> get props => [userId, description];
}

class ChangeTaskStatusEvent extends UserDetailsEvent {
  final int userId;
  final int taskId;
  final String status;

  const ChangeTaskStatusEvent({required this.userId, required this.taskId, required this.status});

  @override
  List<Object> get props => [userId, taskId, status];
}
