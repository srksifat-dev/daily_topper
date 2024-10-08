import 'package:daily_topper/core/routes/error_screen.dart';
import 'package:daily_topper/core/routes/navbar.dart';
import 'package:daily_topper/core/routes/routes.dart';
import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/view/all_categories_screen.dart';
import 'package:daily_topper/view/article_screen.dart';
import 'package:daily_topper/view/home_screen.dart';
import 'package:daily_topper/view/news_details_screen.dart';
import 'package:daily_topper/view/notification_screen.dart';
import 'package:daily_topper/view/profile_screen.dart';
import 'package:go_router/go_router.dart';


class RouteGenerator {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return const ErrorPage();
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.home,
                path: '/',
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    name: Routes.allCategoryScreen,
                    path: Routes.allCategoryScreen,
                    builder: (_, state) => AllCategoriesScreen(),
                  ),
                  GoRoute(
                    name: Routes.newsDetails,
                    path: Routes.newsDetails,
                    builder: (_, state) => NewsDetailsScreen(news: state.extra as NewsModel),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.article,
                path: '/${Routes.article}',
                builder: (context, state) => const ArticleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  name: Routes.notification,
                  path: '/${Routes.notification}',
                  builder: (context, state) => const NotificationScreen(),),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  name: Routes.profile,
                  path: '/${Routes.profile}',
                  builder: (context, state) => const ProfileScreen()),
            ],
          ),
        ],
      ),
    ],
  );
}
