/// Classes
import 'package:model_layer/api/location.dart';
import 'package:model_layer/api/origin.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;
  bool? favourite;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
    this.favourite
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      Character(
        id: json["id"] as int,
        name: json["name"] as String,
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Origin.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"]),
        url: json["url"],
        created: json["created"],
        favourite: false
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "origin": origin,
    "location": location,
    "image": image,
    "episode": episode,
    "url": url,
    "created": created,
    "favourite": favourite
  };
}