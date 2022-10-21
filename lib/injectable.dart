import 'package:dio/dio.dart';
import 'package:gallery_app/application/data_receiver.dart';
import 'package:gallery_app/domain/photo.dart';
import 'package:gallery_app/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

///instance of GetIt
final GetIt getIt = GetIt.instance;

///This method needed for configure GetIt
@injectableInit
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<DataReceiver<PhotosList>>(() => DataReceiver<PhotosList>(PhotosList.empty()));
}
