import 'package:divar_aviz/data/dashboard/datasource/dashboard_datasource.dart';
import 'package:divar_aviz/di/di_init.dart';

void initDataSources() {
  locator.registerFactory<IDashboardDatasource>(
      () => DashboardRemoteDatasource(locator.get()));
}
