import 'package:get_it/get_it.dart';
import 'package:location_leo/mobx/map.store.dart';
import 'package:location_leo/mobx/splash.store.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  setupMobx();
}

void setupMobx() {
  sl.registerLazySingleton<SplashStore>(() => SplashStore());
  sl.registerLazySingleton<MapStore>(() => MapStore());
}
