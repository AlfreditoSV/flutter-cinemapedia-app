import 'package:cinemapedia_app/domain/entities/actors/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/actors/credits_tmdb.dart';

class ActorMapper {
  static Actor ActorTmdbToEntity(CreditsTmdb actor) {
    return Actor(
      adult: actor.adult,
      gender: actor.gender,
      id: actor.id,
      knownForDepartment: actor.knownForDepartment,
      name: actor.name,
      originalName: actor.originalName,
      popularity: actor.popularity,
      profilePath: actor.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${actor.profilePath}'
          : 'https://www.movienewsletters.net/photos/000000H1.jpg',
      creditId: actor.creditId,
    );
  }
}
