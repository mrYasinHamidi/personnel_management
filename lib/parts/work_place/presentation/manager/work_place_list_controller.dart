import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/common/tools/custom_page_load_controller.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/work_place/domain/params/get_work_place_list_param.dart';
import 'package:personnel_management/parts/work_place/domain/usecases/get_work_place_list_usecase.dart';

class WorkPlaceListController extends GetxController {
  final GetWorkPlaceListUseCase getWorkPlaceList;

  WorkPlaceListController({required this.getWorkPlaceList});

  late final loadController = CustomPagingController<WorkPlaceEntity>(
    onPageRequest: _getData,
    pageCount: Constants.paginationSize,
  );

  _getData(int page) {
    try {
      final param = GetWorkPlaceListParam(
        page: page,
        limit: loadController.pageCount,
      );
      getWorkPlaceList.call(param).then(
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

  createWorkPlace() {
    Get.toNamed(RoutesName.createWorkPlace);
  }

  editWorkPlace(WorkPlaceEntity entity) {
    Get.toNamed(
      RoutesName.createWorkPlace,
      arguments: entity,
    );
  }

  deleteWorkPlace(WorkPlaceEntity entity) {
    Get.toNamed(
      RoutesName.createWorkPlace,
      arguments: entity,
    );
  }
}
