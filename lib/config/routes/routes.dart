import 'package:clean_app/features/events/presentation/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeScreen());

      // case '/ArticleDetails':
      //   return _materialRoute(
      //       ArticleDetailsView(article: settings.arguments as ArticleEntity));

      // case '/SavedArticles':
      //   return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
