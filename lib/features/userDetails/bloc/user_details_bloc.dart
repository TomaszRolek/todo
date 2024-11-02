import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/app_repository.dart';
import 'package:todo/data/models/task.dart';
import '../../../utils/state_status.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/models/user_details.dart';

part 'user_details_event.dart';

part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc(this._appRepository) : super(const UserDetailsState()) {
    on<LoadDataEvent>((event, emit) async {
      await _loadData(event, emit);
    });
    on<ChangeTaskStatusEvent>((event, emit) async {
      await _changeTaskStatus(event, emit);
    });
    on<AddTaskEvent>((event, emit) async {
      await _addTaskStatus(event, emit);
    });
  }

  final AppRepository _appRepository;
  late String sortBy;
  late String order;
  String? filter;

  Future<void> _loadData(LoadDataEvent event, Emitter<UserDetailsState> emit) async {
    emit(state.copyWith(status: StateStatus.loading, taskStatus: StateStatus.initial, addTaskStatus: StateStatus.initial));
    try {
      sortBy = event.sortBy;
      filter = event.filter ?? filter;
      order = event.order;

      UserDetails? userDetails;
      if (event.initialLoad) {
        userDetails = await _appRepository.getUserDetails(event.userId);
      }
      final userTasks = await _appRepository.getUserTasks(event.userId, order: order, sortBy: sortBy, filter: filter);
      emit(state.copyWith(user: userDetails, status: StateStatus.success, userTasks: userTasks));
    } catch (e) {
      emit(state.copyWith(status: StateStatus.failure, error: e.toString()));
    }
  }

  Future<void> _changeTaskStatus(ChangeTaskStatusEvent event, Emitter<UserDetailsState> emit) async {
    emit(state.copyWith(taskStatus: StateStatus.loading, addTaskStatus: StateStatus.initial));
    try {
      await _appRepository.updateTaskStatus(userId: event.userId, taskId: event.taskId, status: event.status);
      final userTasks = await _appRepository.getUserTasks(event.userId);
      emit(state.copyWith(taskStatus: StateStatus.success, userTasks: userTasks));
    } catch (e) {
      emit(state.copyWith(taskStatus: StateStatus.failure, error: e.toString()));
    }
  }

  Future<void> _addTaskStatus(AddTaskEvent event, Emitter<UserDetailsState> emit) async {
    emit(state.copyWith(addTaskStatus: StateStatus.loading, taskStatus: StateStatus.initial));
    try {
      await _appRepository.addTask(userId: event.userId, description: event.description);
      final userTasks = await _appRepository.getUserTasks(event.userId);
      emit(state.copyWith(addTaskStatus: StateStatus.success, userTasks: userTasks));
    } catch (e) {
      emit(state.copyWith(addTaskStatus: StateStatus.failure, error: e.toString()));
    }
  }
}
