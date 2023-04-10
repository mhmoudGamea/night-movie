import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';
import 'package:night_movie/features/tv/presentation/views/tv_popular_view.dart';
import 'package:night_movie/features/tv/presentation/views/tv_top_rated_view.dart';
import 'package:night_movie/features/watch_list/presentation/views/watch_list.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/movie/presentation/views/details_view.dart';
import '../../features/movie/presentation/views/movie_view.dart';
import '../../features/movie/presentation/views/popular_view.dart';
import '../../features/movie/presentation/views/tabs_main_view.dart';
import '../../features/movie/presentation/views/top_rated_view.dart';
import '../../features/search/presentation/views/search_view.dart';

class AppRoutes {
  static late String path;

  static void getAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        // print('Not Authenticated');
        path = '/';
      } else {
        // print('Authenticated');
        path = TabsMainView.rn;
      }
    });
  }

  static GoRouter get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    initialLocation: path,
    routes: [
      GoRoute(
        path: AuthView.rn,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: TabsMainView.rn,
        builder: (context, state) => const TabsMainView(),
      ),
      GoRoute(
        path: MovieView.rn,
        builder: (context, state) => const MovieView(),
      ),
      GoRoute(
        path: DetailsView.rn,
        builder: (context, state) => DetailsView(
          model: state.extra
              as dynamic, // this model could be MovieModel or RecommendationModel
        ),
      ),
      GoRoute(
        path: PopularView.rn,
        builder: (context, state) => const PopularView(),
      ),
      GoRoute(
        path: TopRatedView.rn,
        builder: (context, state) => const TopRatedView(),
      ),
      GoRoute(
        path: SearchView.rn,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: WatchList.rn,
        builder: (context, state) => const WatchList(),
      ),
      GoRoute(
        path: TvPopularView.rn,
        builder: (context, state) => const TvPopularView(),
      ),
      GoRoute(
        path: TvTopRatedView.rn,
        builder: (context, state) => const TvTopRatedView(),
      ),
      GoRoute(
        path: TvDetailsView.rn,
        builder: (context, state) =>
            TvDetailsView(tvSeriesId: state.extra as int),
      ),
    ],
  );
}
