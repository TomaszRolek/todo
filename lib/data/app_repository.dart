import 'package:dio/dio.dart';

import 'app_service.dart';
import 'models/task.dart';
import 'models/user.dart';
import 'models/user_details.dart';

class AppRepository {
  final AppService _appService;

  AppRepository(this._appService);

  Future<List<User>> getUsers({int page = 1, String? sortBy, String? order}) async {
    try {
      final response = await _appService.getUsers(page: page, sortBy: sortBy, order: order);
      final data = response.data as Map<String, dynamic>;
      final users = (data['users'] as List).map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
      return users;
    } on DioException catch (e) {
      throw handleError(e.response);
    }
  }

  Future<UserDetails> getUserDetails(int userId) async {
    try {
      final response = await _appService.getUserDetails(userId);
      return UserDetails.fromJson(response.data!);
    } on DioException catch (e) {
      throw handleError(e.response);
    }
  }

  Future<List<Task>> getUserTasks(int userId, {int page = 1, String? sortBy, String? order, String? filter}) async {
    try {
      final response =
          await _appService.getUserTasks(userId: userId, page: page, sortBy: sortBy, order: order, filter: filter);
      final data = response.data as Map<String, dynamic>;
      final tasks = (data['tasks'] as List).map((json) => Task.fromJson(json as Map<String, dynamic>)).toList();
      return tasks;
    } on DioException catch (e) {
      throw handleError(e.response);
    }
  }

  Future<Task> addTask({required int userId, required String description}) async {
    try {
      final response = await _appService.addTask(userId: userId, description: description);
      return Task.fromJson(response.data!);
    } on DioException catch (e) {
      throw handleError(e.response);
    }
  }

  Future<Task> updateTaskStatus({required int userId, required int taskId, required String status}) async {
    try {
      final response = await _appService.updateTaskStatus(userId: userId, taskId: taskId, status: status);
      return Task.fromJson(response.data!);
    } on DioException catch (e) {
      throw handleError(e.response);
    }
  }

  Exception handleError<T>(Response<T>? response) {
    return Exception(response?.data?.toString());
  }
}
