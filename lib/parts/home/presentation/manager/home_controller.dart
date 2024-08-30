import 'package:get/get.dart';
import 'package:personnel_management/common/response_state.dart';
import 'package:personnel_management/parts/home/domain/entities/home_data_entity.dart';
import 'package:personnel_management/parts/home/domain/usecases/get_users_usecase.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeController(this.getHomeDataUseCase);

  final homeData = ResponseState<HomeDataEntity>.loading().obs;


  getHomeData() async {
    homeData.value = ResponseState.loading();

    getHomeDataUseCase.call().then((res) {
      res.fold((l) {
        homeData.value = ResponseState.error(l.message);
      }, (r) {
        homeData.value = ResponseState.success(r);
      });
    }).catchError((error) {
      homeData.value = ResponseState.error(error);
    });
  }
}
