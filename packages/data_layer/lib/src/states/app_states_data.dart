// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

// Import Layers
import 'package:model_layer/model_layer.dart';

class AppStateData {
  static const String boxName = 'template_box';
  static const String keyAppState = 'app_state';

  const AppStateData();

  // !!! ATTENTION !!! Read the first.
  // Hive Dependency:   Box<Type> -> Record<Type> -> Data<Class with different types>

  // The postulate (subjectively):
  // The Box can contain only Records of a certain Type.
  // In this Box can contains many Records and they differ by "keyName".
  // Each Record can be a Class containing Data with different Types.

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppStateAdapter());
    await Hive.openBox<AppState>(boxName);
  }

  // Synchronous getting Record from the Box for initialize BloC Statement
  AppState getAppStateSync() {
    final Box<AppState> box = Hive.box<AppState>(boxName);          // Get Box with AppState Data type
    return box.get(keyAppState)                                     // Get Record from the Box
      ?? AppState(autoLogin: false, authLocal: false, counter: 0, switcher: false, text: '');
  }
  // Asynchronous getting Record from the Box
  Future<AppState> getAppState() async {
    final Box<AppState> box = Hive.box<AppState>(boxName);    // Get Box with AppState Data type
    return box.get(keyAppState)                               // Get Record from the Box
        ?? AppState(autoLogin: false, authLocal: false, counter: 0, switcher: false, text: '');
  }
  // Asynchronous setting Record
  Future<void> setAppState(AppState appState) async {
    final Box<AppState> box = Hive.box<AppState>(boxName);          // Get Box with AppState Data type
    await box.put(keyAppState, appState);                           // Put Record to Box
  }

  //Get Auth Local state value from Hive
  Future<bool> getAuthLocal() async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return appState.authLocal ?? false;                            // Return Data of Record
  }
  //Set Auth Local state value to Hive
  Future<void> setAuthLocal(bool value) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return await setAppState(appState.copyWith(authLocal: value)); // Put Record with changes to the Box
  }

  //Get Auto Login state value from Hive
  Future<bool> getAutoLogin() async {
    final  AppState appState = await getAppState();                 // Get Record with current data from Box
    return appState.autoLogin ?? false;                            // Return Data of Record
  }
  //Set Auto Login state value to Hive
  Future<void> setAutoLogin(bool value) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return await setAppState(appState.copyWith(autoLogin: value)); // Put Record with changes to the Box
  }

  //Get Counter state value from Hive
  Future<int> getCounter() async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return appState.counter ?? 0;                                   // Return Data of Record
  }
  //Set Counter state value to Hive
  Future<void> setCounter(int value) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return await setAppState(appState.copyWith(counter: value));    // Put Record with changes to the Box
  }

  //Get Switcher state value from Hive
  Future<bool> getSwitch() async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return appState.switcher ?? false;                              // Return Data of Record
  }
  //Set Switcher state value to Hive
  Future<void> setSwitch(bool value) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return await setAppState(appState.copyWith(switcher: value));   // Put Record with changes to the Box
  }

  //Get Text state value from Hive
  Future<String> getText() async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return appState.text ?? '';                                     // Return Data of Record
  }
  //Set Text state value to Hive
  Future<void> setText(String value) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box
    return await setAppState(appState.copyWith(text: value));       // Put Record with changes to the Box
  }

  Future<bool> getSwitches(String key) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box

    switch (key) {
      case 'swSecurity':
        return appState.swSecurity ?? false;                        // Return Data of Record
      case 'swFireAlarm':
        return appState.swFireAlarm ?? false;                       // Return Data of Record
      case 'swSprinkler':
        return appState.swFireAlarm ?? false;                       // Return Data of Record

      default:
        return false;
    }
  }

  Future<void> setSwitches(String key, bool data) async {
    final AppState appState = await getAppState();                  // Get Record with current data from Box

    switch (key) {
      case 'swSecurity':
        await setAppState(appState.copyWith(swSecurity: data));     // Put Record with changes to the Box
      case 'swFireAlarm':
        await setAppState(appState.copyWith(swFireAlarm: data));    // Put Record with changes to the Box
      case 'swSprinkler':
        await setAppState(appState.copyWith(swSprinkler: data));    // Put Record with changes to the Box
    }
  }
}
