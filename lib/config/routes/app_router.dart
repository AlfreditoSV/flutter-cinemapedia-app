import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.routeName,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-parameter';

            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
