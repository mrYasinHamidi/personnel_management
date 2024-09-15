import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/parts/manager/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/edit_work_place_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/usecases/create_work_place_usecase.dart';
import 'package:personnel_management/parts/manager/work_place/domain/usecases/edit_work_place_usecase.dart';

class CreateWorkPlaceController extends GetxController {
  final CreateWorkPlaceUseCase createWorkPlace;
  final EditWorkPlaceUseCase editWorkPlace;

  CreateWorkPlaceController({
    required this.createWorkPlace,
    required this.editWorkPlace,
  });

  final WorkPlaceEntity? entity = Get.arguments is WorkPlaceEntity ? Get.arguments : null;

  late final formKey = GlobalKey<FormState>();
  late final nameController = TextEditingController(text: entity?.name);
  late final cityController = TextEditingController(text: entity?.city);
  late final addressController = TextEditingController(text: entity?.address);
  late final latController = TextEditingController(text: '${entity?.latitude ?? ''}');
  late final lonController = TextEditingController(text: '${entity?.longitude ?? ''}');
  late final radiusController = TextEditingController(text: '${entity?.radius ?? ''}');

  submit() {
    try {
      if (!formKey.currentState!.validate()) return;
      if (entity == null) {
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
      } else {
        final param = EditWorkPlaceParam(
          id: entity!.id,
          name: nameController.text.trim(),
          city: cityController.text.trim(),
          address: addressController.text.trim(),
          longitude: double.parse(lonController.text.trim()),
          latitude: double.parse(lonController.text.trim()),
          radius: radiusController.text.trim().isNotEmpty ? int.parse(radiusController.text.trim()) : null,
        );
        editWorkPlace.call(param).then((value) {
          value.fold(
            (l) => Toast.showError(l.message),
            (r) => Toast.showSuccessMessage(),
          );
        });
      }
    } catch (e) {}
  }
}
