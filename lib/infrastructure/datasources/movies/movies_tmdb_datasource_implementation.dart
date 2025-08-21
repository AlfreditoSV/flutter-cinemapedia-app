import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movies/movie_details_mapper.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movies/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/movies/movie_details_response.dart';
import 'package:cinemapedia_app/infrastructure/models/movies/movie_tmdb_reponse.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia_app/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie.dart';

class MoviesTmdbDatasourceImplementation extends MoviesDatasource {
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Authorization': ' Bearer ${Environment.apiKeyTMDB}',
        'accept': 'application/json',
      },
      baseUrl: 'https://api.themoviedb.org',
      queryParameters: {'language': 'es-Mx'},
    ),
  );

  List<Movie> movies(Response<dynamic> response) {
    final dataMoviesTMDB = MovieTmdbReponse.fromJson(response.data);

    final List<Movie> movies = dataMoviesTMDB.results
        .where((movie) => movie.posterPath != 'no-poster')
        .map((movie) => MovieMapper.moviesTMDBToEntity(movie))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/3/movie/now_playing',
      queryParameters: {'page': page},
    );

    return movies(response);
  }

  @override
  Future<List<Movie>> getPopularity({int page = 1}) async {
    final response = await dio.get(
      '/3/movie/popular',
      queryParameters: {'page': page},
    );

    return movies(response);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/3/movie/top_rated',
      queryParameters: {'page': page},
    );

    return movies(response);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/3/movie/upcoming',
      queryParameters: {'page': page},
    );

    return movies(response);
  }

  @override
  Future<MovieDetails> getMovieById(String id) async {
    final response = await dio.get('/3/movie/$id');

    if (response.statusCode != 200) throw Exception('Error en la conexion');

    final movie = MovieDetailsMapper.movieDetailsToEntity(
      MovieDetailsResponse.fromJson(response.data),
    );
    return movie;
  }
}
