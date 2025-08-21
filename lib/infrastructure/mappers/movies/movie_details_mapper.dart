import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';
import 'package:cinemapedia_app/infrastructure/models/movies/movie_details_response.dart';

class MovieDetailsMapper {
  static MovieDetails movieDetailsToEntity(MovieDetailsResponse movie) {
    return MovieDetails(
      adult: movie.adult,
      backdropPath: movie.backdropPath != null
          ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
          : 'https://www.movienewsletters.net/photos/000000H1.jpg',
      belongsToCollection: movie.belongsToCollection,
      budget: movie.budget,
      genres: movie.genres,
      homepage: movie.homepage,
      id: movie.id,
      imdbId: movie.imdbId,
      originCountry: movie.originCountry,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != null
          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
          : 'https://www.movienewsletters.net/photos/000000H1.jpg',
      productionCompanies: movie.productionCompanies,
      productionCountries: movie.productionCountries,
      releaseDate: movie.releaseDate,
      revenue: movie.revenue,
      runtime: movie.runtime,
      spokenLanguages: movie.spokenLanguages,
      status: movie.status,
      tagline: movie.tagline,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
