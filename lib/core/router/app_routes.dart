import 'package:flutter/material.dart';

import 'package:clean_architecture_movies/features/movies/presentation/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'details': (BuildContext context) => const DetailsScreen(),
  };
}
