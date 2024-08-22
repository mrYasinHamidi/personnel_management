import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/main.dart';
import 'package:personnel_management/parts/showcase/presentation/manager/showcase_controller.dart';

class ShowcasePage extends GetView<ShowcaseController> {
  const ShowcasePage({super.key});

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
