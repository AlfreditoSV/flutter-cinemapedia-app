import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:cinemapedia_app/infrastructure/datasources/movies/movies_tmdb_datasource_implementation.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movies/movies_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_tmdb_provider.g.dart';

@Riverpod(keepAlive: true)
class MoviesTmdbProvider extends _$MoviesTmdbProvider  {
  
  int currentPage = 0;
  bool isLoading=false;

  @override
  List<Movie> build(){
    return [];
  }

  Future<void> loadNextPage() async {
    if(isLoading==true) return;

    isLoading=true;
    currentPage++;
    final movies = await MoviesRepositoryImplementation(
      datasource: MoviesTmdbDatasourceImplementation(),
    ).getNowPlaying(page: currentPage);

    state = [...state,...movies];
    
    isLoading=false;
    ref.notifyListeners();
  }
}
