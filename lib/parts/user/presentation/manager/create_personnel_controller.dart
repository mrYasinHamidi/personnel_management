import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/use_cases/create_personnel_usecase.dart';

class CreatePersonnelController extends GetxController {
  final CreatePersonnelUseCase createPersonnelUseCase;

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final personnelCodeController = TextEditingController();
  final nationalCodeController = TextEditingController();
  final startDateController = DefaultDatePickerController();
  final endDateController = DefaultDatePickerController();

  final loading = false.obs;

  CreatePersonnelController({required this.createPersonnelUseCase});

  submit() {
    try {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;

      final param = CreatePersonnelParams(
        username: usernameController.text.trim(),
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirm: passwordConfirmController.text.trim(),
        nationalCode: nationalCodeController.text.trim(),
        personnelCode: int.parse(personnelCodeController.text.trim()),
        workStartDate: startDateController.value!.toDateTime(),
        workEndDate: endDateController.value!.toDateTime(),
      );

      createPersonnelUseCase.call(param).then(
        (value) {
          value.fold(
            (l) => Toast.showError(l.message),
            (r) => Toast.showSuccessMessage(),
          );
          loading.value = false;
        },
      );
    } catch (e) {
      loading.value = false;
    }
  }

}

