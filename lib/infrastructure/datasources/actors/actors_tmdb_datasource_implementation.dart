import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/actors/actors_datasource.dart';
import 'package:cinemapedia_app/domain/entities/actors/actor.dart';
import 'package:cinemapedia_app/infrastructure/mappers/actors/actor_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/actors/credits_tmdb_response.dart';
import 'package:dio/dio.dart';

class ActorsTmdbDatasourceImplementation extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org',
      headers: {
        'Authorization': ' Bearer ${Environment.apiKeyTMDB}',
        'accept': 'application/json',
      },
      queryParameters: {'language': 'es-Mx'},
    ),
  );
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/3/movie/$movieId/credits');
    if (response.statusCode != 200)
      throw Exception('Error en la conexión de actores');

    final data = CreditsTmdbResponse.fromJson(response.data);

    final actors=data.cast.map((credit)=>ActorMapper.ActorTmdbToEntity(credit)).toList();

    return actors;
  }
}
