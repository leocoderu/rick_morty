/// Import Packages
import 'package:hive/hive.dart';

part 'favourite.g.dart';

@HiveType(typeId: 1)
class Favourite extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? status;

  @HiveField(3)
  String? species;

  @HiveField(4)
  String? type;

  @HiveField(5)
  String? gender;

  //@HiveField(6)
  //Origin origin;

  //@HiveField(7)
  //Location location;

  @HiveField(8)
  String? image;

  @HiveField(9)
  List<String>? episode;

  @HiveField(10)
  String? url;

  @HiveField(11)
  String? created;

  //@HiveField(12)
  //bool favourite;

  Favourite({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    //this.origin,
    //this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
    //this.favourite
  });

  Favourite copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    //Origin? origin,
    //Location? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
    //bool? favourite,
  }) => Favourite(
    id: id ?? this.id,
    name: name ?? this.name,
    status: status ?? this.status,
    species: species ?? this.species,
    type: type ?? this.type,
    gender: gender ?? this.gender,
    //origin: origin ?? this.origin,
    //location: location ?? this.location,
    image: image ?? this.image,
    episode: episode ?? this.episode,
    url: url ?? this.url,
    created: created ?? this.created,
    //favourite: favourite ?? this.favourite,
  );

  @override
  String toString() =>
      'Favourites(id: $id, '
          'name: $name, '
          'status: $status, '
          'species: $species, '
          'type: $type,'
          'gender: $gender,'
          //'origin: $origin,'
          //'location: $location'
          'image: $image'
          'episode: $episode'
          'url: $url'
          'created: $created'
          //'favourite: $favourite'
          ')';
}