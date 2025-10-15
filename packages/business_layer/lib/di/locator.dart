// Import Packages
import 'package:get_it/get_it.dart';
import 'package:triple_switch/triple_switch.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

final locator = GetIt.instance;

Future<void> setupServices() async {
  locator
      // ..registerSingleton<LocalPin>(LocalPin())
      // ..registerSingleton<LocalPinController>(LocalPinController())
      //
      // ..registerSingleton<LocalAuthController>(LocalAuthController())
      // ..registerSingleton<LocalAuth>(LocalAuth())

      ..registerSingleton<AppStateController>(AppStateController())
      ..registerSingleton<AppStateData>(AppStateData())

      ..registerSingleton<ThemeController>(ThemeController())
      ..registerSingleton<ThemeDataCustom>(ThemeDataCustom())

      ..registerSingleton<FunctionController>(FunctionController());

  await locator.get<ThemeController>().init();    // Hive initialization
  await locator.get<AppStateController>().init(); // Hive initialization

  SwitchState().data = {
    'switchSecurity':  SwitchModel(
      position: await locator.get<AppStateController>().getSwitches('swSecurity'),
      saveFunc: (data) => locator.get<AppStateController>().setSwitches('swSecurity', data),
    ),
    'switchFireAlarm': SwitchModel(
      position: await locator.get<AppStateController>().getSwitches('swFireAlarm'),
      saveFunc: (data) => locator.get<AppStateController>().setSwitches('swFireAlarm', data),
    ),
    'switchSprinkler': SwitchModel(
      position: await locator.get<AppStateController>().getSwitches('swSprinkler'),
      saveFunc: (data) => locator.get<AppStateController>().setSwitches('swSprinkler', data),
    ),
    'switchTemp': SwitchModel(),
  };
}