import 'package:model_layer/model_layer.dart';

class CharacterRepoLocal{
  List<Character> _characters = [
    Character(
        id: 1,
        name: 'Sophie Marceau',
        status: 'Alive',
        species: 'Human',
        type: 'Actress',
        gender: 'Woman',
        origin: Origin(
            name: 'Alien Spa',
            url: 'https://rickandmortyapi.com/api/location/64'
        ),
        location: Location(
            name: 'Paris',
            url: 'https://www.paris.com'
        ),
        image: 'https://i.pinimg.com/736x/a3/b4/41/a3b441e9147a08e482ba526fc05ced5b.jpg',
        episode: [
          'https://rickandmortyapi.com/api/episode/27'
        ],
        url: 'https://i.pinimg.com/736x/a3/b4/41/a3b441e9147a08e482ba526fc05ced5b.jpg',
        created: '2018-01-10T18:20:41.703Z'
    ),
    Character(
        id: 2,
        name: 'Reese Witherspoon',
        status: 'Alive',
        species: 'Human',
        type: 'Actress',
        gender: 'Woman',
        origin: Origin(
            name: 'Alien Spa',
            url: 'https://rickandmortyapi.com/api/location/64'
        ),
        location: Location(
            name: 'California',
            url: 'https://www.usa.com'
        ),
        image: 'https://i.pinimg.com/originals/53/db/27/53db27a974946b37e75ec23305eac5a2.jpg',
        episode: [
          'https://rickandmortyapi.com/api/episode/27'
        ],
        url: 'https://i.pinimg.com/originals/53/db/27/53db27a974946b37e75ec23305eac5a2.jpg',
        created: '2018-01-10T18:20:41.703Z'
    ),
    Character(
        id: 1,
        name: 'Sophie Marceau',
        status: 'Alive',
        species: 'Human',
        type: 'Actress',
        gender: 'Woman',
        origin: Origin(
            name: 'Alien Spa',
            url: 'https://rickandmortyapi.com/api/location/64'
        ),
        location: Location(
            name: 'Paris',
            url: 'https://www.paris.com'
        ),
        image: 'https://i.pinimg.com/736x/a3/b4/41/a3b441e9147a08e482ba526fc05ced5b.jpg',
        episode: [
          'https://rickandmortyapi.com/api/episode/27'
        ],
        url: 'https://i.pinimg.com/736x/a3/b4/41/a3b441e9147a08e482ba526fc05ced5b.jpg',
        created: '2018-01-10T18:20:41.703Z'
    ),
    Character(
        id: 2,
        name: 'Reese Witherspoon',
        status: 'Alive',
        species: 'Human',
        type: 'Actress',
        gender: 'Woman',
        origin: Origin(
            name: 'Alien Spa',
            url: 'https://rickandmortyapi.com/api/location/64'
        ),
        location: Location(
            name: 'California',
            url: 'https://www.usa.com'
        ),
        image: 'https://i.pinimg.com/originals/53/db/27/53db27a974946b37e75ec23305eac5a2.jpg',
        episode: [
          'https://rickandmortyapi.com/api/episode/27'
        ],
        url: 'https://i.pinimg.com/originals/53/db/27/53db27a974946b37e75ec23305eac5a2.jpg',
        created: '2018-01-10T18:20:41.703Z'
    ),
  ];

  List<Character> getCharacters() => _characters;
}

