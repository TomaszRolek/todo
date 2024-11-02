import 'package:todo/services/router/app_router.dart';
import 'app.dart';
import 'bootstrap.dart';
import 'data/app_repository.dart';
import 'data/app_service.dart';

void main() async {
  await bootstrap(() async {
    final appService = AppService("https://google.com");
    final appRepository = AppRepository(appService);
    final router = AppRouter(appRepository);

    return App(router: router, appRepository: appRepository);
  });
}
