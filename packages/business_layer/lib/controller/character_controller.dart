/// Import Dart
import 'dart:isolate';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';
import 'package:model_layer/model_layer.dart';

class CharacterController {
  Future<void> init() async => await locator.get<FavStateData>().initHive();

  Future<void> getCharacters(int? page, ReceivePort receivePort) async =>
      await locator.get<CharacterRepo>().getCharacters(page, receivePort);

  Future<void> addFavourites(Character character) async =>
      await locator.get<FavStateData>().addFavourite(character);

  Future<void> delFavourites(Character character) async =>
      await locator.get<FavStateData>().delFavourite(character);

  Future<List<Favourite>> getFavourites() async =>
      await locator.get<FavStateData>().getFavourites();

  void clearBox() => locator.get<FavStateData>().clearBox();
}