import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
import 'package:personnel_management/common/widgets/default_time_picker.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/usecases/shift_usecase.dart';

class CreateShiftController extends GetxController {
  final CreateShiftUseCase createShift;

  CreateShiftController({required this.createShift});

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final startTimeController = DefaultTimePickerController();

  final endTimeController = DefaultTimePickerController();

  final floatTimeController = TextEditingController();

  submit() {
    if (!formKey.currentState!.validate()) return;

    final param = CreateShiftParam(
      name: nameController.text.trim(),
      startTime: startTimeController.value!,
      endTime: endTimeController.value!,
      floatTime: floatTimeController.text.trim().isEmpty ? null : int.tryParse(floatTimeController.text),
    );
    createShift.call(param);
  }
}
