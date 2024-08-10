import 'package:divar_aviz/data/dashboard/repository/dashboard_repository.dart';
import 'package:divar_aviz/di/di_init.dart';

void initRepsitories() {
  locator.registerFactory<IDashboardRepository>(
      () => DashboardRepository(locator.get()));
}
