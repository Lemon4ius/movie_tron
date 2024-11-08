
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_tron/src/core/base_di/base_di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true
)
void configureDependencies() => getIt.init();