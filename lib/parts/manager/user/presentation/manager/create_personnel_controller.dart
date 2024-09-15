import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
import 'package:personnel_management/parts/manager/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/edit_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/use_cases/create_personnel_usecase.dart';
import 'package:personnel_management/parts/manager/user/domain/use_cases/delete_personnel_usecase.dart';
import 'package:personnel_management/parts/manager/user/domain/use_cases/edit_personnel_usecase.dart';

class CreatePersonnelController extends GetxController {
  final CreatePersonnelUseCase createPersonnelUseCase;
  final EditPersonnelUseCase editPersonnelUseCase;
  final DeletePersonnelUseCase deletePersonnelUseCase;

  final formKey = GlobalKey<FormState>();

  final PersonnelEntity? entity = Get.arguments is PersonnelEntity ? Get.arguments : null;

  late final usernameController = TextEditingController(text: entity?.username);
  late final nameController = TextEditingController(text: entity?.name);
  late final passwordController = TextEditingController();
  late final passwordConfirmController = TextEditingController();
  late final personnelCodeController = TextEditingController(text: '${entity?.personnelCode ?? ''}');
  late final nationalCodeController = TextEditingController(text: entity?.nationalCode);
  late final startDateController = DefaultDatePickerController.fromDateTime(entity?.workStartDate);
  late final endDateController = DefaultDatePickerController.fromDateTime(entity?.workEndDate);

  final loading = false.obs;

  CreatePersonnelController({
    required this.createPersonnelUseCase,
    required this.deletePersonnelUseCase,
    required this.editPersonnelUseCase,
  });

  submit() {
    try {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;

      if (entity == null) {
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
      } else {
        final param = EditPersonnelParams(
          id: entity!.id,
          username: usernameController.text.trim(),
          name: nameController.text.trim(),
          password: passwordController.text.trim(),
          passwordConfirm: passwordConfirmController.text.trim(),
          nationalCode: nationalCodeController.text.trim(),
          personnelCode: int.parse(personnelCodeController.text.trim()),
          workStartDate: startDateController.value!.toDateTime(),
          workEndDate: endDateController.value!.toDateTime(),
        );

        editPersonnelUseCase.call(param).then(
          (value) {
            value.fold(
              (l) => Toast.showError(l.message),
              (r) => Toast.showSuccessMessage(),
            );
            loading.value = false;
          },
        );
      }
    } catch (e) {
      loading.value = false;
    }
  }

  delete() {
    try {
      deletePersonnelUseCase.call(entity!.id).then(
        (value) {
          value.fold(
            (l) => Toast.showError(l.message),
            (r) => Toast.showSuccessMessage(),
          );
          loading.value = false;
        },
      );
    } catch (e) {}
  }
}
