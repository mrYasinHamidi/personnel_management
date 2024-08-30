import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/home/data/data_dources/remote/endpoints.dart';
import 'package:personnel_management/parts/home/data/data_dources/remote/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> getHomeData() async {
    final res = await request.get(HomeEndpoints.dashboard);
    return ResponseModel.fromJson(res.data);
  }
}
