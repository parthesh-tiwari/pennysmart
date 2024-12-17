import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pennysmart/views/BottomNavigationView.dart';
import 'package:pennysmart/views/home_page_parent_view.dart';
import 'package:pennysmart/views/profile_page.dart';
import 'package:pennysmart/views/statistics_page_view.dart';
import 'package:pennysmart/views/subscriptions_view.dart';

class AppNavigation {
  AppNavigation._();

  static String initialRoute = "/home";

  //navigator key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorKeyHome =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");

  static final _rootNavigatorKeyReminders =
      GlobalKey<NavigatorState>(debugLabel: "shellReminders");

  static final _rootNavigatorKeySearch =
      GlobalKey<NavigatorState>(debugLabel: "shellSearch");

  static final _rootNavigatorKeyProfile =
      GlobalKey<NavigatorState>(debugLabel: "shellProfile");

  //go router configuration
  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialRoute,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                BottomNavigationView(navigationShell: navigationShell),
            branches: <StatefulShellBranch>[
              StatefulShellBranch(navigatorKey: _rootNavigatorKeyHome, routes: [
                GoRoute(
                  path: "/home",
                  name: "BottomNavigationView",
                  builder: (context, state) => HomePagParentView(
                    key: state.pageKey,
                  ),
                )
              ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigatorKeyReminders,
                  routes: [
                    GoRoute(
                      path: "/reminders",
                      name: "RemindersPageView",
                      builder: (context, state) => SubscriptionsView(
                        key: state.pageKey,
                      ),
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigatorKeySearch,
                  routes: [
                    GoRoute(
                      path: "/search",
                      name: "SearchPageView",
                      builder: (context, state) => StatisticsPageView(
                        key: state.pageKey,
                      ),
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigatorKeyProfile,
                  routes: [
                    GoRoute(
                      path: "/profile",
                      name: "ProfilePageView",
                      builder: (context, state) => ProfilePageView(
                        key: state.pageKey,
                      ),
                    )
                  ])
            ]),
      ]);
}
