/// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

/// Import Layers
import 'package:model_layer/model_layer.dart';

class FavStateData {
  static const String boxName = 'rickmorty_favourite_box';
  static const String keyFavState = 'fav_state_list2';

  const FavStateData();

  // !!! ATTENTION !!! Read the first.
  // Hive Dependency:   Box<Type> -> Record<Type> -> Data<Class with different types>

  // The postulate (subjectively):
  // The Box can contain only Records of a certain Type.
  // In this Box can contains many Records and they differ by "keyName".
  // Each Record can be a Class containing Data with different Types.

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavouriteAdapter());
    await Hive.openBox<List<Favourite>>(boxName);
  }

  void clearBox() => Hive.box<List<Favourite>>(boxName).clear();

  // Synchronous getting Record from the Box for initialize BloC Statement
  List<Favourite> getFavStateSync() {
    final Box<List<Favourite>> box = Hive.box<List<Favourite>>(boxName);    // Get Box with FavState Data type
    return box.get(keyFavState) ?? [];  // Get Record from the Box
  }
  // Asynchronous getting Record from the Box
  Future<List<Favourite>> getFavState() async {
    final Box<List<Favourite>> box = Hive.box<List<Favourite>>(boxName);    // Get Box with FavState Data type
    return box.get(keyFavState) ?? [];  // Get Record from the Box
  }

  // Asynchronous setting Record
  Future<void> setFavState(List<Favourite> listFavState) async {
    final Box<List<Favourite>> box = Hive.box<List<Favourite>>(boxName);    // Get Box with FavState Data type
    await box.put(keyFavState, listFavState);                             // Put Record to Box
  }

  //Get Favourites state value from Hive
  Future<List<Favourite>> getFavourites() async => await getFavState();    // Get Record with current data from Box

  // //Set Favourites state value to Hive
  // Future<void> setFavourites(List<FavState> favourite, int index) async {
  //   final List<FavState> favState = await getFavState();                  // Get Record with current data from Box
  //   return await setFavState(favState[index].copyWith(favourites: value)); // Put Record with changes to the Box
  // }

  //Set Favourites state value to Hive
  Future<void> addFavourite(Character character) async {
    //final List<Favourite> listFavState = await getFavState();                 // Get Record with current data from Box
    //if (listFavState.contains((element) => element.id == value))
    print('Im here');
    //print('#1 ${listFavState.length}');
    // if (listFavState.contains((Favourite e) => e.id == character.id)) {
    //   print('inside');
    //   listFavState.add(
    //       Favourite(
    //         id: character.id,
    //         name: character.name,
    //         status: character.status,
    //         species: character.species,
    //         type: character.type,
    //         gender: character.gender,
    //         image: character.image,
    //         episode: character.episode,
    //         url: character.url,
    //         created: character.created
    //       )
    //   );
    //   await setFavState(listFavState); // Put Record with changes to the Box
    // }
    //print('#2 ${listFavState.length}');
  }

  //Set Favourites state value to Hive
  Future<void> delFavourite(Character character) async {
    final List<Favourite> favourites = await getFavState();                  // Get Record with current data from Box
    await favourites.remove(favourites.where((e) => e.id == character.id));
    return await setFavState(favourites);                                     // Put Record with changes to the Box
  }
}
