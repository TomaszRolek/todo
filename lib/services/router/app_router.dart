import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/data/app_repository.dart';
import 'package:todo/features/userDetails/view/user_details_page.dart';
import '../../features/dashboard/view/dashboard_page.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter(this._appRepository);
  final AppRepository _appRepository;
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          name: AppRoutes.dashboard,
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return DashboardPage(appRepository: _appRepository);
          }),
      GoRoute(
          name: AppRoutes.userDetails,
          path: '/user_details',
          builder: (BuildContext context, GoRouterState state) {
            final extras = state.extra! as Map<String, dynamic>;
            final userId = extras['userId'] as int;
            return UserDetailsPage(appRepository: _appRepository, userId: userId);
          }),
    ],
  );

  void back({dynamic arguments}) => router.pop(arguments);
}
