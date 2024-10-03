import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_spacing.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:blott_mobile_assesment/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kcSecondary50,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.width),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/sms_icon.png',
                      height: 98.height,
                      width: 98.width,
                    ),
                  ),
                  verticalSpace(28),
                  Text(
                    'Get the most out of Blott ✅',
                    textAlign: TextAlign.center,
                    style: Styles.hLg(
                      color: const Color(0xFF1E1F20),
                    ),
                  ),
                  verticalSpace(16),
                  Text(
                    'Allow notifications to stay in the '
                    'loop with your payments, requests and groups.',
                    textAlign: TextAlign.center,
                    style: Styles.regularMd(
                      color: AppColors.kcText500,
                    ),
                  ),
                ],
              ),
            ),
            AppButton(
              text: 'Continue',
              onTap: () {},
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
