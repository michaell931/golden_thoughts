import 'package:get_it/get_it.dart';
import 'package:golden_thoughts/app/injection_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
