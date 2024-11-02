import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/app_repository.dart';
import 'package:todo/data/models/user.dart';
import '../../../utils/state_status.dart';


part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._appRepository) : super(const DashboardState()) {
    on<LoadDataEvent>((event, emit) async {
      await _loadData(event, emit);
    });
  }
  final AppRepository _appRepository;


  Future<void> _loadData(LoadDataEvent event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      final users = await _appRepository.getUsers(order: event.order, sortBy: event.sortBy);
      emit(state.copyWith(users: users, status: StateStatus.success));
    } catch (e) {
      emit(state.copyWith( error: e.toString()));
    }
  }
}
