import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

void setupLocator() {

  GetIt.I.registerLazySingleton(() => NavigationService());
}