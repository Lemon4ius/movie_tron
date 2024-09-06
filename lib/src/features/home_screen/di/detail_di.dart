import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/features/home_screen/data/repo_impl/home_repo_impl.dart';
import 'package:movie_tron/src/features/home_screen/domain/repository/home_repository.dart';

void detailSetupLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<HomeRepository>(getIt.get<HomeRepoImpl>());
}
