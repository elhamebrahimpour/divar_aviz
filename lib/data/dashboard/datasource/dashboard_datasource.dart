import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:dio/dio.dart';

abstract class IDashboardDatasource {
  Future<List<Promotion>> getHotPromotions();
}

class DashboardRemoteDatasource extends IDashboardDatasource {
  final Dio _dio;

  DashboardRemoteDatasource(this._dio);

  @override
  Future<List<Promotion>> getHotPromotions() async {
    try {
      var response = await _dio.get('get_hot_promotions');

      return response.data['items']
          .map<Promotion>(
            (jsonObject) => Promotion.fromJson(jsonObject),
          )
          .toList();
    } catch (e) {
      throw Exception();
    }
  }
}
