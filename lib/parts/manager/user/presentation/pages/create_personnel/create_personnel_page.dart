import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/extensions/string_ext.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
import 'package:personnel_management/common/widgets/default_text_field.dart';
import 'package:personnel_management/parts/manager/user/presentation/manager/create_personnel_controller.dart';

class CreatePersonnelPage extends GetView<CreatePersonnelController> {
  const CreatePersonnelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createPersonnel'.tr),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                DefaultTextField(
                  controller: controller.nameController,
                  validator: (value) => value?.isValidName() ?? false ? null : 'nameValidationError'.tr,
                  label: 'name'.tr,
                ),
                const SizedBox(height: 8),
                DefaultTextField(
                  controller: controller.usernameController,
                  validator: (value) => value?.isValidUsername() ?? false ? null : 'usernameValidationError'.tr,
                  label: 'username'.tr,
                ),
                const SizedBox(height: 8),
                DefaultTextField(
                  controller: controller.passwordController,
                  validator: (value) => value?.isValidPassword() ?? false ? null : 'passwordValidationError'.tr,
                  label: 'password'.tr,
                ),
                const SizedBox(height: 8),
                DefaultTextField(
                  controller: controller.passwordConfirmController,
                  validator: (value) =>
                      controller.passwordConfirmController.text.trim() == controller.passwordController.text.trim()
                          ? null
                          : 'passwordsNotMatch'.tr,
                  label: 'passwordConfirm'.tr,
                ),
                const SizedBox(height: 8),
                DefaultTextField(
                  controller: controller.personnelCodeController,
                  label: 'personnelCode'.tr,
                ),
                const SizedBox(height: 8),
                DefaultTextField(
                  controller: controller.nationalCodeController,
                  label: 'nationalCode'.tr,
                ),
                const SizedBox(height: 8),
                DefaultDatePicker(
                  controller: controller.startDateController,
                  label: 'workStartDate'.tr,
                  counterText: 'workStartDateNotRequired'.tr,
                ),
                const SizedBox(height: 8),
                DefaultDatePicker(
                  controller: controller.endDateController,
                  label: 'workEndDate'.tr,
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
      ),
    );
  }
}
