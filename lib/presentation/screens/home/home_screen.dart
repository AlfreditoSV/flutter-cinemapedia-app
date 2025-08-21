import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:cinemapedia_app/presentation/widgets/shared/cutstom_bottom_navigation.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'hombe_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CutstomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => __HomeViewState();
}

class __HomeViewState extends ConsumerState<_HomeView> {
  int count = 0;

  @override
  void initState() {
    super.initState();

    ref.read(moviesTmdbProviderProvider.notifier).loadNextPage();
    ref.read(moviesTmdbPopularityProvider.notifier).loadNextPage();
    ref.read(moviesTmdbUpcomingProvider.notifier).loadNextPage();
    ref.read(moviesTmdbTopRatedProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(initialLoadingProvider);
    
  if (isLoading) {
      return FullScreenLoader();
    }
    final movies = ref.watch(moviesTmdbProviderProvider);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);
    final moviesPopularity = ref.watch(moviesTmdbPopularityProvider);
    final moviesUpcoming = ref.watch(moviesTmdbUpcomingProvider);
    final moviesTopRated = ref.watch(moviesTmdbTopRatedProvider);

    return Visibility(
      visible: !isLoading,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: moviesSlideShow),
                  MoviesHorizontalSlideshow(
                    movies: movies,
                    title: 'Estrenos',
                    subTitle: 'Miercoles 20',
                    loadNextPage: ref
                        .read(moviesTmdbProviderProvider.notifier)
                        .loadNextPage,
                  ),
                  MoviesHorizontalSlideshow(
                    movies: moviesPopularity,
                    title: 'Populares',
                    subTitle: 'Miercoles 20',
                    loadNextPage: ref
                        .read(moviesTmdbPopularityProvider.notifier)
                        .loadNextPage,
                  ),
                  MoviesHorizontalSlideshow(
                    movies: moviesUpcoming,
                    title: 'Proximamente',
                    subTitle: 'Miercoles 20',
                    loadNextPage: ref
                        .read(moviesTmdbUpcomingProvider.notifier)
                        .loadNextPage,
                  ),
                  MoviesHorizontalSlideshow(
                    movies: moviesTopRated,
                    title: 'Tops',
                    subTitle: 'Miercoles 20',
                    loadNextPage: ref
                        .read(moviesTmdbTopRatedProvider.notifier)
                        .loadNextPage,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
