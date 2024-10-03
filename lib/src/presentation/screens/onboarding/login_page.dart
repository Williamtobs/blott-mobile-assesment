import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_spacing.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:blott_mobile_assesment/src/core/router/app_router.dart';
import 'package:blott_mobile_assesment/src/data/datasource/remote/local_storage.dart';
import 'package:blott_mobile_assesment/src/presentation/widgets/custom_circle_button.dart';
import 'package:blott_mobile_assesment/src/presentation/widgets/custom_text_field.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    final firstNameActive = useState(false);
    final lastNameActive = useState(false);

    firstNameController.addListener(() {
      firstNameActive.value = firstNameController.text.isNotEmpty;
    });

    lastNameController.addListener(() {
      lastNameActive.value = lastNameController.text.isNotEmpty;
    });

    return Scaffold(
      backgroundColor: AppColors.kcSecondary50,
      appBar: AppBar(
        backgroundColor: AppColors.kcSecondary50,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Your legal name',
          style: Styles.hXl(
            color: AppColors.kcText900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.width),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(16),
                    Text(
                      'We need to know a bit about you '
                      'so that we can create your account.',
                      style: Styles.regularMd(
                        color: AppColors.kcText500,
                      ),
                    ),
                    verticalSpace(24),
                    CustomTextField(
                      hintText: 'First name',
                      textInputAction: TextInputAction.next,
                      controller: firstNameController,
                    ),
                    verticalSpace(25),
                    CustomTextField(
                      hintText: 'Last name',
                      textInputAction: TextInputAction.done,
                      controller: lastNameController,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(24),
            Align(
              alignment: Alignment.centerRight,
              child: CustomCircleButton(
                isActive: firstNameActive.value && lastNameActive.value,
                onTap: () {
                  LocalStorage().writeData(
                    'firstName',
                    firstNameController.text,
                  );
                  LocalStorage().writeData(
                    'lastName',
                    lastNameController.text,
                  );
                  context.router.replace(const NotificationRoute());
                },
              ),
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
