import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/domain/entities/movies/movie_details.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const String routeName = 'movie_screen';
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMoviesProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetails? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => _MovieDetails(movie: movie),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final MovieDetails movie;
  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath!,
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title!, style: textStyle.titleLarge),
                    Text(movie.overview!),
                  ],
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Wrap(
            children: [
              ...movie.genres!.map((item) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text('${item.name}'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        _ActorsByMovie(movieId: movie.id.toString()),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final MovieDetails movie;
  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.7,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(5, 10, 5, 20),
        title: Text(
          movie.title!,
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: FadeIn(child: Image.network(movie.posterPath!, fit: BoxFit.cover)),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0, 0.4],
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovies = ref.watch(actorsByMoviesProvider);
if(actorsByMovies[movieId]==null){
    return Center(child: CircularProgressIndicator());
}
final actors=ref.watch(actorsByMoviesProvider)[movieId];
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors!.length,
        itemBuilder: (context, index) {
        final actor=actors[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeIn(
                  child: Image.network(actor.profilePath!,
                  fit: BoxFit.cover,
                  width: 180,
                  height: 250,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(actor.name,maxLines: 2,),
              SizedBox(height: 10,),
              Text(actor.character??"",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),
              )
          
            ],
          ),
        );
        

        },
      ),
    );
  }
}
