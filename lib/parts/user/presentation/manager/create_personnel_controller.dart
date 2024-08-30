import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/parts/user/domain/use_cases/create_personnel_usecase.dart';

class CreatePersonnelController extends GetxController {
  final CreatePersonnelUseCase createPersonnelUseCase;
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final personnelCodeController = TextEditingController();
  final nationalCodeController = TextEditingController();

  CreatePersonnelController({required this.createPersonnelUseCase});

  createPersonnel() {}
}
