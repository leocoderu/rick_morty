/// Import Flutter & Dart
import 'package:flutter/material.dart';
import 'dart:isolate';
import 'dart:convert';

/// Import Layers
import 'package:model_layer/model_layer.dart';

/// Import Packages
import 'package:http/http.dart' as http;

Future<void> requestCharacters(({int? page, SendPort sendPort}) data) async {
  CharacterList? characters;

  String api = 'https://rickandmortyapi.com/api/character';

  print('URL: $api${(data.page != null) ? '?page=${data.page}' : ''}');
  final characterResponse = await http.get(Uri.parse('$api${(data.page != null) ? '?page=${data.page}' : ''}'));

  try {
    if (characterResponse.statusCode == 200) {
      characters = CharacterList.fromJson(json.decode(characterResponse.body));
    } else {
      debugPrint('Request error: ${characterResponse.statusCode}');
    }
  } catch (e) {
    debugPrint('API error: ${e.toString()}');
  }
  data.sendPort.send(characters);
}

class CharacterRepo {
  Future<void> getCharacters(int? page, ReceivePort receiverPort) async =>
    await Isolate.spawn(requestCharacters, (page: page, sendPort:receiverPort.sendPort));
}