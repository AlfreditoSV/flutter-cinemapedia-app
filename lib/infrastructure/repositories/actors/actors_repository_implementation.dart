// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinemapedia_app/domain/datasources/actors/actors_datasource.dart';
import 'package:cinemapedia_app/domain/entities/actors/actor.dart';
import 'package:cinemapedia_app/domain/repositories/actors/actors_repository.dart';

class ActorsRepositoryImplementation extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorsRepositoryImplementation({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
