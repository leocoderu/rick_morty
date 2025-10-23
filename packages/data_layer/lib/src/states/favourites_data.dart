/// Import Packages
import 'package:hive_flutter/hive_flutter.dart';

/// Import Layers
import 'package:model_layer/model_layer.dart';

class FavouritesData {
  static const String boxName = 'rickmorty_favourite_box';
  //static const String keyFavState = 'rickmorty_favourite_list';

  const FavouritesData();

  // !!! ATTENTION !!! Read the first.
  // Hive Dependency:   Box<Type> -> Record<Type> -> Data<Class with different types>

  // The postulate (subjectively):
  // The Box can contain only Records of a certain Type.
  // In this Box can contains many Records and they differ by "keyName".
  // Each Record can be a Class containing Data with different Types.

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavouriteAdapter());
    await Hive.openBox<Favourite>(boxName);
  }

  void clearBox() => Hive.box<Favourite>(boxName).clear();

  // Synchronous getting Record from the Box for initialize BloC Statement
  List<Favourite> getFavouritesSync() {
    final Box<Favourite> box = Hive.box<Favourite>(boxName);    // Get Box with FavState Data type
    return box.values.toList();  // Get Record from the Box
  }
  // Asynchronous getting Record from the Box
  Future<List<Favourite>> getFavourites() async {
    final Box<Favourite> box = Hive.box<Favourite>(boxName);    // Get Box with FavState Data type
    return await box.values.toList();  // Get Record from the Box
  }

  //Add Favourite to Hive
  Future<void> addFavourite(Character character) async {
    final Box<Favourite> box = Hive.box<Favourite>(boxName);    // Get Box with FavState Data type
    if (!box.values.any((Favourite favourite) => favourite.id == character.id)) {
      box.add(
        Favourite(
          id: character.id,
          name: character.name,
          status: character.status,
          species: character.species,
          type: character.type,
          gender: character.gender,
          image: character.image,
          episode: character.episode,
          url: character.url,
          created: character.created
        )
      );
    }
  }

  //Del Favourite from Hive
  // Future<void> delFavourite(Character character) async {
  //   final Box<Favourite> box = Hive.box<Favourite>(boxName);    // Get Box with FavState Data type
  //   final objectToDelete = box.values.firstWhere((element) => element.id == character.id);
  //   box.delete(objectToDelete.key);
  // }

  Future<void> delFavourite(Favourite favourite) async {
    final Box<Favourite> box = Hive.box<Favourite>(boxName);    // Get Box with FavState Data type
    final objectToDelete = box.values.firstWhere((element) => element.id == favourite.id);
    box.delete(objectToDelete.key);
  }
}
