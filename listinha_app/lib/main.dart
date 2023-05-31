import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/app_module.dart';
import 'package:listinha_app/src/app_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() => runApp(
      RxRoot(
        child: ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      ),
    );


  // final ConfigurationService _configurationService;

  // AppStore(this._configurationService) {
  //   init();
  // }

  // void init() {
  //   final model = _configurationService.getConfiguration();
  //   syncDate.value = model.syncDate;
  //   themeMode.value = _getThemeModeByName(model.themeModeName);
  // }

  // void save() {
  //   _configurationService.saveConfiguration(
  //     themeMode.value.name,
  //     syncDate.value,
  //   );
  // }

  // void changeThemeMode(ThemeMode? mode) {
  //   if (mode != null) {
  //     themeMode.value = mode;
  //     save();
  //   }
  // }

  // void setSyncDate(DateTime date) {
  //   syncDate.value = date;
  //   save();
  // }

  // void deleteApp() {
  //   _configurationService.deleteAll();
  // }

  // ThemeMode _getThemeModeByName(String name) {
  //   return ThemeMode.values.firstWhere((element) => element.name == name);
  // }