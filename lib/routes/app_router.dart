import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: SplashRoute.page, initial: true),
        /// Initial Route
        AutoRoute(page: HomeRoute.page),

        /// Login Route
        AutoRoute(page: LoginRoute.page),

        /// Protected Route
        AutoRoute(page: ProfileRoute.page, guards: [AuthGuard()]),

        /// Normal Route
        AutoRoute(page: AboutRoute.page,guards: [AuthGuard()]),
      ];
}
