import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/extensions/string_ext.dart';
import 'package:personnel_management/parts/auth/presentation/manager/login_manager_controller.dart';

class LoginManagerPage extends GetView<LoginManagerController> {
  const LoginManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.emailController,
                  validator: (value) => value?.isValidEmail() ?? false ? null : 'emailValidationError'.tr,
                  decoration: InputDecoration(labelText: 'email'.tr),
                ),
                TextFormField(
                  controller: controller.passwordController,
                  validator: (value) => value?.isValidPassword() ?? false ? null : 'passwordValidationError'.tr,
                  decoration: InputDecoration(labelText: 'password'.tr),
                ),
                ElevatedButton(
                  onPressed: controller.submit,
                  child: Text('login'.tr),
                ),
                ElevatedButton(
                  onPressed: controller.openSignupPage,
                  child: Text('signup'.tr),
                ),
                ElevatedButton(
                  onPressed: controller.openLoginPersonnelPage,
                  child: Text('loginPersonnel'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
