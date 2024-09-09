import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/common/tools/custom_page_load_controller.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';
import 'package:personnel_management/parts/shift/domain/usecases/get_shift_list_usecase.dart';

class ShiftListController extends GetxController {
  final GetShiftListUseCase getShiftList;

  ShiftListController({required this.getShiftList});

  late final loadController = CustomPagingController<ShiftEntity>(
    onPageRequest: _getShifts,
    pageCount: Constants.paginationSize,
  );

  createShift() {
    Get.toNamed(RoutesName.createShift);
  }

  editShift(ShiftEntity entity) {
    Get.toNamed(RoutesName.createShift, arguments: entity);
  }

  _getShifts(int page) {
    try {
      final param = GetShiftListParam(
        page: page,
        limit: loadController.pageCount,
      );
      getShiftList.call(param).then(
        (value) {
          value.fold(
            (l) => loadController.error = l.message,
            (r) => loadController.addPage(r.data),
          );
        },
      );
    } catch (e) {
      Toast.showError(e.toString());
    }
  }
}
