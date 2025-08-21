import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalSlideshow extends ConsumerStatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const MoviesHorizontalSlideshow({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  ConsumerState<MoviesHorizontalSlideshow> createState() =>
      _MoviesHorizontalSlideshowState();
}

class _MoviesHorizontalSlideshowState
    extends ConsumerState<MoviesHorizontalSlideshow> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if(widget.loadNextPage==null)return;

    scrollController.addListener(() {
      final pixel = scrollController.position.pixels;
      final screen = scrollController.position.maxScrollExtent;

      if ((pixel + 200) >= screen) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTtile: widget.subTitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                final movie = widget.movies[index];
                return FadeInRight(child: _Slide(movie: movie));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 150,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GestureDetector(
                    onTap: ()=>context.push('/movie/${movie.id}'),
                    child: FadeIn(child: child));
                },
              ),
            ),
          ),

          //*Ttile
          SizedBox(
            width: 150,
            height: 50,
            child: Text(movie.title, maxLines: 2, style: titleStyle.titleSmall),
          ),

          //*Rating
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                SizedBox(width: 5),
                Text(
                  '${movie.voteAverage}',
                  style: titleStyle.bodyMedium?.copyWith(
                    color: Colors.yellow.shade800,
                  ),
                ),
                const Spacer(),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: titleStyle.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTtile;
  const _Title({this.title, this.subTtile});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTtile != null)
            FilledButton.tonal(onPressed: () {}, child: Text(subTtile!)),
        ],
      ),
    );
  }
}
