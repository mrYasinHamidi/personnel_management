import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/shift/domain/params/shift_param.dart';

part 'shift_endpoints.dart';

class ShiftRemoteDataSourceImpl extends ShiftRemoteDataSource {
  const ShiftRemoteDataSourceImpl({required super.request});
  
  @override
  Future<ResponseModel> sampleRequest(ShiftParam param) async {
    final res = await request.post(
      ShiftEndpoints.sampleEndpoint,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }
  
}
