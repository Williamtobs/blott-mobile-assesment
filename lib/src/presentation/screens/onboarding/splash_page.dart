import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/main.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:blott_mobile_assesment/src/core/router/app_router.dart';
import 'package:blott_mobile_assesment/src/data/datasource/remote/local_storage.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => handleNavigation(),
    );
  }

  handleNavigation() async {
    final firstName = await LocalStorage().readData('firstName');
    if (firstName != null) {
      router.replace(const NotificationRoute());
    } else {
      router.replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/white_logo.png',
              height: 74.8.height,
              width: 134.26.width,
            ),
          ),
        ],
      ),
    );
  }
}
