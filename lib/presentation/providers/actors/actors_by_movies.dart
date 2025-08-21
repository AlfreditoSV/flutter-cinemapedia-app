import 'package:cinemapedia_app/domain/entities/actors/actor.dart';
import 'package:cinemapedia_app/infrastructure/datasources/actors/actors_tmdb_datasource_implementation.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actors/actors_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_by_movies.g.dart';

@Riverpod(keepAlive: true)
class ActorsByMovies extends _$ActorsByMovies {
  @override
  Map<String, List<Actor>> build() {
    return {};
  }

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await ActorsRepositoryImplementation(
      datasource: ActorsTmdbDatasourceImplementation(),
    ).getActorsByMovie(movieId);

    state = {...state, movieId: actors};
  }
}
