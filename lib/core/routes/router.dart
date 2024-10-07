import 'package:go_router/go_router.dart';
import 'package:my_ca/features/Profile/presentation/pages/detail_user_page.dart';

import '../../features/Profile/presentation/pages/all_users_page.dart';

class MyRouter {
  get router => GoRouter(initialLocation: "/", routes: [
        GoRoute(
            path: "/",
            name: "all-users",
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AllUsersPage()),
            routes: [
              GoRoute(
                  path: "/detail-user",
                  name: "detail_user",
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: DetailUserPage()))
            ]),
      ]);
}
