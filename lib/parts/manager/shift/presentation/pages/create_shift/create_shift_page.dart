import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/extensions/date_ext.dart';
import 'package:personnel_management/common/extensions/string_ext.dart';
import 'package:personnel_management/common/widgets/default_text_field.dart';
import 'package:personnel_management/common/widgets/default_time_picker.dart';
import 'package:personnel_management/parts/manager/shift/presentation/manager/create_shift_controller.dart';

class CreateShiftPage extends GetView<CreateShiftController> {
  const CreateShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createShift'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              DefaultTextField(
                label: 'name'.tr,
                controller: controller.nameController,
                validator: (value) => value?.isValidName() ?? false ? null : 'nameValidationError'.tr,
              ),
              const SizedBox(height: 8),
              DefaultTimePicker(
                controller: controller.startTimeController,
                label: 'workStartTime'.tr,
                validator: (value) => value != null ? null : 'startTimeValidationError'.tr,
              ),
              const SizedBox(height: 8),
              DefaultTimePicker(
                controller: controller.endTimeController,
                label: 'workEndTime'.tr,
                validator: (value) => value?.isValidEndTime(controller.startTimeController.value) ?? false
                    ? null
                    : 'endTimeValidationError'.tr,
              ),
              const SizedBox(height: 8),
              DefaultTextField(
                label: '${'floatTime'.tr} (${'minute'.tr})',
                controller: controller.floatTimeController,
                justInteger: true,
                suffixIcon: Tooltip(
                  message: 'floatTimeNotInfo'.tr,
                  child: const Icon(Icons.info_outline),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: controller.submit,
                child: Text('submit'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
