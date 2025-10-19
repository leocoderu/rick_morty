/// Import Dart
import 'dart:isolate';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

class CharacterController {
  Future<void> getCharacters(int? page, ReceivePort receivePort) async =>
      await locator.get<CharacterRepo>().getCharacters(page, receivePort);
}