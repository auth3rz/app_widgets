import 'package:app_widgets/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) {
        return const CardsScreen();
      },
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) {
        return const ProgressScreen();
      },
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) {
        return const SnackbarScreen();
      },
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) {
        return const AnimatedScreen();
      },
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) {
        return const UiControlsScreen();
      },
    ),
    GoRoute(
      path: '/intro',
      name: AppTutorialScreen.name,
      builder: (context, state) {
        return const AppTutorialScreen();
      },
    ),
    GoRoute(
      path: '/scroll',
      name: InfiniteScrollScreen.name,
      builder: (context, state) {
        return const InfiniteScrollScreen();
      },
    ),
  ],
);