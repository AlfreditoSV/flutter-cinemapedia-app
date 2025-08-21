// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia_app/domain/entities/movies/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  
  final List<Movie> movies;

 const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    final colors=Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsetsGeometry.only(bottom: 10),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: Colors.blueGrey
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 5)),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: DecoratedBox(
          decoration: decoration,
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
