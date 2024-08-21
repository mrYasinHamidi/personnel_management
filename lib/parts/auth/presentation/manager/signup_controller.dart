import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/signup_use_case.dart';

class SignupController extends GetxController {
  final _signup = Get.find<SignupUseCase>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    final res = await _signup.call(
      SignupParam(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirm: passwordConfirmController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
      ),
    );
    res.fold(
      (l) {
        Toast.showError(l.error.toString());
      },
      (r) {
        Get.offNamed(RoutesName.login);
      },
    );
  }

  void openLoginPage() async {
    Get.offNamed(RoutesName.login);
  }
}
