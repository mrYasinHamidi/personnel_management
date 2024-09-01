import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/parts/user/presentation/manager/create_work_place_controller.dart';

class CreateWorkPlacePage extends GetView<CreateWorkPlaceController> {
  const CreateWorkPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createWorkPlace'.tr),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
