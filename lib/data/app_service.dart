import 'dart:async';
import 'package:dio/dio.dart';

typedef Json = Map<String, dynamic>;

class AppService {
  late Dio dio;

  AppService(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  //TODO: all methods are mocked, so any changes are not visible in app
  Future<Response<Json>> getUsers({int page = 1, String? sortBy, String? order}) async {
    // return dio.get('/api/users', queryParameters: {'page': page, 'sortBy': sortBy, 'order': order});
    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/api/users'),
      data: {
        "users": [
          {
            "id": 1,
            "name": "John Doe",
            "email": "john.doe@example.com",
            "createdDate": "2023-10-01",
          },
          {
            "id": 2,
            "name": "Jane Smith",
            "email": "jane.smith@example.com",
            "createdDate": "2023-09-25",
          },
        ]
      },
      statusCode: 200,
    );
  }

  Future<Response<Json>> getUserDetails(int id) async {
    // return dio.get('/api/users/$id');
    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/api/users/$id'),
      data: {
        "id": id,
        "name": "John Doe",
        "email": "john.doe@example.com",
        "createdDate": "2023-10-01",
        "address": "123 Main St, Cityville",
        "phone": "+123456789",
      },
      statusCode: 200,
    );
  }

  Future<Response<Json>> getUserTasks({
    required int userId,
    int page = 1,
    String? sortBy,
    String? order,
    String? filter,
  }) async {
    // return dio.get('/api/users/$userId/tasks', queryParameters: {'page': page, 'sortBy': sortBy, 'order': order, 'filter': filter});
    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/api/users/$userId/tasks'),
      data: {
        "currentPage": page,
        "totalPages": 5,
        "tasks": [
          {
            "id": 1,
            "description": "Finish project documentation",
            "createdDate": "2023-10-20",
            "status": "unresolved",
          },
          {
            "id": 2,
            "description": "Fix bug in authentication module",
            "createdDate": "2023-10-15",
            "status": "resolved",
          },
        ]
      },
      statusCode: 200,
    );
  }

  Future<Response<Json>> addTask({required int userId, required String description}) async {
    // return dio.post('/api/users/$userId/tasks', data: {"description": description});

    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/api/users/$userId/tasks'),
      data: {
        "id": 3,
        "description": description,
        "createdDate": "2023-10-22",
        "status": "unresolved",
      },
      statusCode: 201,
    );
  }

  Future<Response<Json>> updateTaskStatus({required int userId, required int taskId, required String status}) async {
    // return dio.patch('/api/users/$userId/tasks/$taskId', data: {"status": status});
    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/api/users/$userId/tasks/$taskId'),
      data: {
        "id": taskId,
        "description": "Finish project documentation",
        "createdDate": "2023-10-20",
        "status": status
      },
      statusCode: 200,
    );
  }
}
