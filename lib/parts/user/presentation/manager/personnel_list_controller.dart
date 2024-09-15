import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/tools/custom_page_load_controller.dart';
import 'package:personnel_management/parts/user/domain/params/get_personnel_list_param.dart';
import 'package:personnel_management/parts/user/domain/use_cases/get_personnel_list_usecase.dart';

class PersonnelListController extends GetxController {
  final GetPersonnelListUseCase getPersonnel;

  PersonnelListController({required this.getPersonnel});

  late final loadController = CustomPagingController<PersonnelEntity>(
    onPageRequest: _getData,
    pageCount: Constants.paginationSize,
  );

  openCreateShiftPage() {
    Get.toNamed(RoutesName.createShift);
  }

  _getData(int page) {
    try {
      final param = GetPersonnelListParam(
        page: page,
        limit: loadController.pageCount,
      );
      getPersonnel.call(param).then(
        (value) {
          value.fold(
            (l) => loadController.error = l.message,
            (r) => loadController.addPage(r.data),
          );
        },
      );
    } catch (e) {
      loadController.error = e.toString();
    }
  }

  createPersonnel() {
    Get.toNamed(RoutesName.createPersonnel);
  }

  editPersonnel(PersonnelEntity entity) {
    Get.toNamed(RoutesName.createPersonnel, arguments: entity);
  }

  deletePersonnel(PersonnelEntity entity) {}
}
