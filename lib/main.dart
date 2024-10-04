import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        title: 'Blott Mobile',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kcPrimary600),
          useMaterial3: true,
        ),
        routerConfig: router.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
