import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/extensions/string_ext.dart';
import 'package:personnel_management/parts/auth/presentation/manager/signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  validator: (value) => value?.isNotEmpty ?? false ? null : 'nameValidationError'.tr,
                  decoration: InputDecoration(labelText: 'fullName'.tr),
                ),
                TextFormField(
                  controller: controller.phoneController,
                  validator: (value) => value?.isValidPhoneNumber() ?? false ? null : 'phoneValidationError'.tr,
                  decoration: InputDecoration(labelText: 'mobileNumber'.tr),
                ),
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
                TextFormField(
                  controller: controller.passwordConfirmController,
                  validator: (value) =>
                      controller.passwordConfirmController.text.trim() == controller.passwordController.text.trim()
                          ? null
                          : 'passwordsNotMatch'.tr,
                  decoration: InputDecoration(labelText: 'passwordConfirmation'.tr),
                ),
                ElevatedButton(
                  onPressed: controller.submit,
                  child: Text('signup'.tr),
                ),
                ElevatedButton(
                  onPressed: controller.openLoginPage,
                  child: Text('login'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
