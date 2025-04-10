import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/book/books_page.dart';
import '../../presentation/pages/error/error_screen.dart';
import '../../presentation/pages/splash/splash_screen.dart';
import '../config/routes.dart';
import 'logger.dart';

GoRouter routerInit = GoRouter(
  routes: <RouteBase>[
    ///  =================================================================
    ///  ********************** Splash Route *****************************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.splashRouteName,
      path: AppRoutes.splashRoutePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    ///  =================================================================
    /// ********************** Books Route ******************************
    /// ==================================================================

    GoRoute(
      name: AppRoutes.booksRouteName,
      path: AppRoutes.booksRoutePath,
      builder: (BuildContext context, GoRouterState state) {
        return const BooksPage();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorScreen());
  },
  redirect: (context, state) {
    logger.info('redirect: ${state.uri}');
    return null;
  },
);
