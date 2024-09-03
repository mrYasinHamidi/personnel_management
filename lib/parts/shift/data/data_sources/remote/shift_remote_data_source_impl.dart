import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';

part 'shift_endpoints.dart';

class ShiftRemoteDataSourceImpl extends ShiftRemoteDataSource {
  const ShiftRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> createShift(CreateShiftParam param) async {
    final res = await request.post(
      ShiftEndpoints.createShift,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }

  @override
  Future<ResponseModel> getShiftList(GetShiftListParam param) async {
    final res = await request.get(
      ShiftEndpoints.getShiftList,
      queryParameters: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }
}
