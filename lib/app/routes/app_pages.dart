import 'home_routes.dart';
import 'new_task_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
		...NewTaskRoutes.routes,
  ];
}
