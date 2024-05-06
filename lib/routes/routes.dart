import 'package:auto_route/auto_route.dart';

import '../features/transcript/screens/home_screen.dart';
import '../features/transcript/screens/recording_screen.dart';


part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: RecordingRoute.page),
       
      ];
}
