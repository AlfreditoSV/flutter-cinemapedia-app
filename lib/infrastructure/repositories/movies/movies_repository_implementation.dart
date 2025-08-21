// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinemapedia_app/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';
import 'package:cinemapedia_app/domain/repositories/movies/movie_repository.dart';

class MoviesRepositoryImplementation extends MovieRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImplementation({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopularity({int page = 1}) {
     return datasource.getPopularity(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
     return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
     return datasource.getUpcoming(page: page);
  }

  @override
  Future<MovieDetails> getMovieById(String id) {
       return datasource.getMovieById(id);
  }
}
