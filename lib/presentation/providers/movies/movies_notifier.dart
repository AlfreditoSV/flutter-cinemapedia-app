// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cinemapedia_app/domain/entities/movies/movie.dart';

part 'movies_notifier.g.dart';

typedef MovieCallBack = Future<List<Movie>> Function({int page});

@riverpod
class MoviesNotifier extends _$MoviesNotifier {
  int currentPage = 0;

  @override
  Future<List<Movie>> build({required MovieCallBack fetchMoreMovies}) async {
    return [];
  }

  Future <void> loadNextPage()async{
    currentPage++;
    
    final currentMovies=await future;

    final movies=await fetchMoreMovies(page: currentPage);

    state=AsyncData([...currentMovies,...movies]);
  }

}
