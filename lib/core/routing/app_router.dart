import 'package:fire_app/features/home/presentation/views/categories_view.dart';
import 'package:fire_app/features/home/presentation/views/edit_view.dart';
import 'package:fire_app/features/home/presentation/views/home_view.dart';
import 'package:fire_app/features/inside_collection/presentation/views/add_note_view.dart';
import 'package:fire_app/features/inside_collection/presentation/views/inside_collection_view.dart';
import 'package:fire_app/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../routing/routes.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _createRoute(const SplashScreen());
      case Routes.splashScreen:
        return _createRoute(const SplashScreen());
      case Routes.onBoardingScreen:
        return _createRoute(const OnboardingScreen());
      case Routes.loginView:
        return _createRoute(const LoginView());
      case Routes.registerView:
        return _createRoute(const RegisterView());
      case Routes.homeView:
        return _createRoute(const HomeView());
      case Routes.categoriesView:
        return _createRoute(const CategoriesView());
      case Routes.insideCollectionView:
        {
          final id = settings.arguments as String;
          return _createRoute(InsideCollectionView(id: id));
        }
      case Routes.addNoteView:
        {
          final args = settings.arguments;
          return _createRoute(AddNoteView(docID: args as String));
        }
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
