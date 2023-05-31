import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/configuration/configuration_page.dart';
import 'package:listinha_app/src/configuration/service/configuration_service.dart';
import 'package:listinha_app/src/home/home_module.dart';
import 'package:listinha_app/src/shared/services/realm/realm_config.dart';
import 'package:listinha_app/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.singleton<ConfigurationService>(ConfigurationServiceImpl.new),
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
