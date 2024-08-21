import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:personnel_management/parts/auth/presentation/manager/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.usernameController,
            ),
            TextFormField(
              controller: controller.passwordController,
            ),
            ElevatedButton(
              onPressed: controller.submit,
              child: Text('login'.tr),
            ),
            ElevatedButton(
              onPressed: controller.openSignupPage,
              child: Text('signup'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
