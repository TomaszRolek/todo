import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/data/app_repository.dart';
import 'package:todo/services/router/app_router.dart';

import 'features/dashboard/bloc/dashboard_bloc.dart' as dashboard;
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key, required AppRouter router, required AppRepository appRepository})
      : _router = router,
        _appRepository = appRepository;

  final AppRouter _router;
  final AppRepository _appRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _router),
        RepositoryProvider.value(value: _appRepository),
        RepositoryProvider(
          create: (_) => dashboard.DashboardBloc(_appRepository)..add(const dashboard.LoadDataEvent(order: 'asc', sortBy: 'name')),
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: _router.router.routeInformationProvider,
        routeInformationParser: _router.router.routeInformationParser,
        routerDelegate: _router.router.routerDelegate,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
