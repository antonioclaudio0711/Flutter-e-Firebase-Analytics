import 'package:flutter_firebase/app/modules/increment/presenter/pages/increment_initial_page.dart';
import 'package:flutter_firebase/app/modules/increment/presenter/store/increment_store.dart';
import 'package:flutter_firebase/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IncrementModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => IncrementStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.initialRoute,
          child: (context, args) => IncrementInitialPage(store: context.read()),
        )
      ];
}
