/// Classes
import 'package:model_layer/api/character.dart';
import 'package:model_layer/api/info.dart';

class CharacterList {
  Info? info;
  List<Character>? results;

  CharacterList({required this.info, required this.results});

  factory CharacterList.fromJson(Map<String, dynamic> json) =>
    CharacterList(
        info: Info.fromJson(json["info"]),
        results: List<Character>.from(json["results"].map((dynamic x) => Character.fromJson(x))),
    );

  Map<String, dynamic> toJson() => {"info": info, "results": results};
}