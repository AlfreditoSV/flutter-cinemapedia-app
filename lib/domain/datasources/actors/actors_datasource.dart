import 'package:cinemapedia_app/domain/entities/actors/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovie(String movieId);
}