import 'package:dio/dio.dart';
import 'package:divar_aviz/config/utils/dio_provider.dart';
import 'package:divar_aviz/di/di_datasources.dart';
import 'package:divar_aviz/di/di_repositories.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    DioProvider.createDio(),
  );

  initDataSources();

  initRepsitories();
}
