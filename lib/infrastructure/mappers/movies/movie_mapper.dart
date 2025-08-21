import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/movies/movie_movie_tmdb.dart';

class MovieMapper {
  static Movie moviesTMDBToEntity(MovieMovieTmdb movie) {
    return Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath!=''?'https://image.tmdb.org/t/p/w500${movie.backdropPath}':'https://cdn.displate.com/artwork/270x380/2023-02-03/6b806b90ed460362ce845aec44991468_ee90576e764e6e2dc6be65372d967710.jpg',
      genreIds: movie.genreIds.map((item) => item.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath!='no-poster'?'https://image.tmdb.org/t/p/w500${movie.posterPath}':'no-poster',
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
