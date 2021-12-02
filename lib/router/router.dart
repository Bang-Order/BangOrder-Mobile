import 'package:auto_route/auto_route.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: LandingPage, initial: true),
    AutoRoute(path: '/:id', page: HomePage)
  ],
)
class $AppRouter {}

class AppRouter extends $AppRouter {}
