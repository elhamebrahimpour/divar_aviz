import 'package:divar_aviz/data/dashboard/datasource/dashboard_datasource.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:dartz/dartz.dart';

abstract class IDashboardRepository {
  Future<Either<String, List<Promotion>>> getHotPromotions();
}

class DashboardRepository extends IDashboardRepository {
  final IDashboardDatasource _datasource;

  DashboardRepository(this._datasource);

  @override
  Future<Either<String, List<Promotion>>> getHotPromotions() async {
    try {
      return right(
        await _datasource.getHotPromotions(),
      );
    } catch (e) {
      return left(e.toString());
    }
  }
}
