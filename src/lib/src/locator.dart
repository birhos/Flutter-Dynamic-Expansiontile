import 'package:get_it/get_it.dart';

/// Resources
import 'resources/dataHandler.dart';
import 'resources/service/realDataService.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseRepository());
  locator.registerLazySingleton(() => RealDataService());
}
