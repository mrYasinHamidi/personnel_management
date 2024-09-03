import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/work_place/domain/usecases/work_place_usecase.dart';

class CreateWorkPlaceController extends GetxController {
  final CreateWorkPlaceUseCase createWorkPlace;

  CreateWorkPlaceController({required this.createWorkPlace});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final latController = TextEditingController();
  final lonController = TextEditingController();
  final radiusController = TextEditingController();

  submit() {
    try {
      if (!formKey.currentState!.validate()) return;
      final param = CreateWorkPlaceParam(
        name: nameController.text.trim(),
        city: cityController.text.trim(),
        address: addressController.text.trim(),
        longitude: double.parse(lonController.text.trim()),
        latitude: double.parse(lonController.text.trim()),
        radius: radiusController.text.trim().isNotEmpty ? int.parse(radiusController.text.trim()) : null,
      );
      createWorkPlace.call(param).then((value) {
        value.fold(
              (l) => Toast.showError(l.message),
              (r) => Toast.showSuccessMessage(),
        );
      });
    } catch (e) {}
  }
}
