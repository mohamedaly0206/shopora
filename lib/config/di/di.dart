import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
