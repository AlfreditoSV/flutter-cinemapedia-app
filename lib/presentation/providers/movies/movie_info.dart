import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';
import 'package:cinemapedia_app/infrastructure/datasources/movies/movies_tmdb_datasource_implementation.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movies/movies_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_info.g.dart';

@Riverpod(keepAlive: true)
class MovieInfo extends _$MovieInfo {
  
  @override
  Map<String, MovieDetails> build() {
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    
    if (state[movieId] != null) return;
    final movie = await MoviesRepositoryImplementation(
      datasource: MoviesTmdbDatasourceImplementation(),
    ).getMovieById(movieId);

    state = {...state, movieId: movie};
  }
}
