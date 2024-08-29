import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/main.dart';
import 'package:personnel_management/parts/home/presentation/manager/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: Setup.logout,
          child: Text('logout'.tr),
        ),
      ),
    );
  }
}
