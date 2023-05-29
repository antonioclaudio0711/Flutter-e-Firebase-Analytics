import 'package:flutter_firebase/app/modules/increment/increment_module.dart';
import 'package:flutter_firebase/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Routes.initialRoute,
          module: IncrementModule(),
        )
      ];
}
