import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/parts/home/domain/entities/home_data_entity.dart';
import 'package:personnel_management/parts/home/domain/usecases/get_users_usecase.dart';

class HomeController extends GetxController with StateMixin<HomeDataEntity> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeController(this.getHomeDataUseCase);

  openCreatePersonnelPage() {
    Get.toNamed(RoutesName.createPersonnel);
  }

  getHomeData() async {
    change(null, status: RxStatus.loading());
    getHomeDataUseCase.call().then((res) {
      res.fold((l) {
        change(null, status: RxStatus.error(l.message));
      }, (r) {
        change(r, status: RxStatus.success());
      });
    }).catchError((error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
