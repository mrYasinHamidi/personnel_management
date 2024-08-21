import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static void showError(String error) {
    Get.snackbar(
      'error'.tr,
      error,
      backgroundColor: Colors.red,
    );
  }
}
