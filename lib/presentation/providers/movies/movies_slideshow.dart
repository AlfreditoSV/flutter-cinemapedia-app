import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_tmdb_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie.dart';

part 'movies_slideshow.g.dart';

@Riverpod(keepAlive: true)
 List<Movie>moviesSlideShow(Ref ref) {
  final movies = ref.watch(moviesTmdbProviderProvider);
  if(movies.isEmpty)return [];
  
  return movies.sublist(0,6).toList();
}