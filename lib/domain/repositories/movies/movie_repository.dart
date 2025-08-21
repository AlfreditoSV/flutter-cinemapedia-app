import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopularity({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<MovieDetails> getMovieById(String id);
}
