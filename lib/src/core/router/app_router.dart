import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/home/home_page.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/home/web_view_page.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/onboarding/login_page.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/onboarding/notification_page.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/onboarding/splash_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: NotificationRoute.page, path: '/notification'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: WebViewRoute.page, path: '/webview'),
  ];
}
