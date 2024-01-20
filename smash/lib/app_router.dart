import 'package:flutter/material.dart';
import 'package:smash/ui/pages/city/list_page.dart';
import 'package:smash/ui/pages/pages.dart';

class AppRouter {
  static final NavigatorObserver navigatorObserver = NavigatorObserver();

  final Duration defaultAnimationTime = const Duration(milliseconds: 300);
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case CityListPage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return CityListPage(
              args: routeSettings.arguments as CityListPageArguments,
            );
          },
        );
      // case MorePage.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const MorePage();
      //     },
      //   );
      default:
        return null;
    }
  }

  MaterialPageRoute errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('page not found'),
        ),
      ),
    );
  }
}
