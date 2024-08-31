import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_date_picker.dart';
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

  CreatePersonnelController({required this.createPersonnelUseCase});

  createPersonnel() {}
}
