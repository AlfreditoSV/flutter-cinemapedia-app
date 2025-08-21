import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:cinemapedia_app/infrastructure/datasources/movies/movies_tmdb_datasource_implementation.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movies/movies_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_tmdb_upcoming.g.dart';

@Riverpod(keepAlive: true)
class MoviesTmdbUpcoming extends _$MoviesTmdbUpcoming {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading == true) return;
    isLoading = true;
    currentPage++;
    final movies = await MoviesRepositoryImplementation(
      datasource: MoviesTmdbDatasourceImplementation(),
    ).getUpcoming(page: currentPage);

    state = [...state, ...movies];
    isLoading = false;
    ref.notifyListeners();
  }
}
