/// Import Dart
import 'dart:isolate';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';
import 'package:model_layer/model_layer.dart';

class CharacterController {
  List<Character> getCharactersF() => locator.get<CharacterRepoLocal>().getCharacters();
  Future<void> getCharacters(int page, ReceivePort receivePort) async =>
      await locator.get<CharacterRepo>().getCharacters(page, receivePort);

}