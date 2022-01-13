import 'package:flutter/material.dart';

import 'search/presenter/search_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      title: 'Example',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SearchPage.routeName:
                return const SearchPage();
              default:
                return const SearchPage();
            }
          },
        );
      },
    );
  }
}
