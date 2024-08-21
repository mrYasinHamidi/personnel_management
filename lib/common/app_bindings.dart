import 'package:get/get.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/core/request/request.dart';
import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource_impl.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(
      () => Request(
        baseUrl: () => Constants.baseUrl,
        token: () => '',
      ),
      fenix: true,
    );
    await Get.putAsync(
      () => AuthLocalDataSourceImpl.build(),
      permanent: true,
    );
  }
}
