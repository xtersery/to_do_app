import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    //AutoRoute(page: TaskListRoute.page),
    AutoRoute(page: SideMenu.page, path: '/'),
    AutoRoute(page: SettingsRoute.page),
  ];
}
