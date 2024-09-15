import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/extensions/string_ext.dart';
import 'package:personnel_management/common/widgets/default_text_field.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/manager/create_work_place_controller.dart';

class CreateWorkPlacePage extends GetView<CreateWorkPlaceController> {
  const CreateWorkPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'createWorkPlace'.tr,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            DefaultTextField(
              controller: controller.nameController,
              label: 'name'.tr,
              validator: (value) => value?.isValidName() ?? false ? null : 'nameValidationError'.tr,
            ),
            DefaultTextField(
              controller: controller.cityController,
              label: 'city'.tr,
              validator: (value) => value?.trim().isNotEmpty ?? false ? null : 'cityValidationError'.tr,
            ),
            DefaultTextField(
              controller: controller.latController,
              justFloat: true,
              label: 'lat'.tr,
              validator: (value) => value?.trim().isNotEmpty ?? false ? null : 'latValidationError'.tr,
            ),
            DefaultTextField(
              controller: controller.lonController,
              label: 'lon'.tr,
              justFloat: true,
              validator: (value) => value?.trim().isNotEmpty ?? false ? null : 'lonValidationError'.tr,
            ),
            DefaultTextField(
              controller: controller.addressController,
              label: 'address'.tr,
              validator: (value) => value?.isValidName() ?? false ? null : 'addressValidationError'.tr,
            ),
            DefaultTextField(
              controller: controller.radiusController,
              label: 'radius'.tr,
              justInteger: true,
              counterText: 'default50'.tr,
            ),
            ElevatedButton(
              onPressed: controller.submit,
              child: Text('submit'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
