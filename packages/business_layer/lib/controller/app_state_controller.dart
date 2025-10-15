// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';
import 'package:model_layer/model_layer.dart';

class AppStateController {
  Future<void> init() async => await locator.get<AppStateData>().initHive();

  AppState getAppState() => locator.get<AppStateData>().getAppStateSync();

  Future<bool> getAuthLocal() async => await locator.get<AppStateData>().getAuthLocal();
  Future<void> setAuthLocal(bool value) async => await locator.get<AppStateData>().setAuthLocal(value);

  Future<bool> getAutoLogin() async => await locator.get<AppStateData>().getAutoLogin();
  Future<void> setAutoLogin(bool value) async => await locator.get<AppStateData>().setAutoLogin(value);

  Future<int>  getCounter() async => await locator.get<AppStateData>().getCounter();
  Future<void> setCounter(int value) async => await locator.get<AppStateData>().setCounter(value);

  Future<bool> getSwitch() async => await locator.get<AppStateData>().getSwitch();
  Future<void> setSwitch(bool value) async => await locator.get<AppStateData>().setSwitch(value);

  Future<String> getText() async => await locator.get<AppStateData>().getText();
  Future<void> setText(String value) async => await locator.get<AppStateData>().setText(value);

  Future<bool> getSwitches(String key) async => await locator.get<AppStateData>().getSwitches(key);
  Future<void> setSwitches(String key, bool data) async => await locator.get<AppStateData>().setSwitches(key, data);
}