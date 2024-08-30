import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
import 'package:personnel_management/parts/user/presentation/manager/create_personnel_controller.dart';

class CreatePersonnelPage extends GetView<CreatePersonnelController> {
  const CreatePersonnelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'name'.tr),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'username'.tr),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'password'.tr),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'passwordConfirm'.tr),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'personnelCode'.tr),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'nationalCode'.tr),
              ),
              const SizedBox(height: 8),
              const DefaultDatePicker(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
