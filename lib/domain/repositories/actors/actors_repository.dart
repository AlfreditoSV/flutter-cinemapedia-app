import 'package:cinemapedia_app/domain/entities/actors/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
