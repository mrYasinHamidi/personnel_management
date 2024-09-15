import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/common/widgets/default_time_picker.dart';
import 'package:personnel_management/parts/manager/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/edit_shift_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/usecases/create_shift_usecase.dart';
import 'package:personnel_management/parts/manager/shift/domain/usecases/edit_shift_usecase.dart';

class CreateShiftController extends GetxController {
  final CreateShiftUseCase createShift;
  final EditShiftUseCase editShift;

  CreateShiftController({
    required this.createShift,
    required this.editShift,
  });

  final ShiftEntity? entity = Get.arguments is ShiftEntity ? Get.arguments : null;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final startTimeController = DefaultTimePickerController();

  final endTimeController = DefaultTimePickerController();

  final floatTimeController = TextEditingController();

  submit() async {
    if (!formKey.currentState!.validate()) return;
    if (entity == null) {
      final param = CreateShiftParam(
        name: nameController.text.trim(),
        startTime: startTimeController.value!,
        endTime: endTimeController.value!,
        floatTime: floatTimeController.text.trim().isEmpty ? null : int.tryParse(floatTimeController.text),
      );

      createShift.call(param).then(
        (value) {
          value.fold(
            (l) => Toast.showError(l.message),
            (r) => Toast.showSuccessMessage(),
          );
        },
      );
    } else {
      final param = EditShiftParam(
        id: entity!.id,
        name: nameController.text.trim(),
        startTime: startTimeController.value!,
        endTime: endTimeController.value!,
        floatTime: floatTimeController.text.trim().isEmpty ? null : int.tryParse(floatTimeController.text),
      );

      editShift.call(param).then(
        (value) {
          value.fold(
            (l) => Toast.showError(l.message),
            (r) => Toast.showSuccessMessage(),
          );
        },
      );
    }
  }
}
