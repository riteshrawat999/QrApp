import 'package:flutter/material.dart';
import 'package:qr_scanner_app/presentation/screens/navigation_menu.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle named routes here
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const NavigationMenu(),
            );

          // Add more routes as needed
          default:
            return MaterialPageRoute(
              builder: (context) => const NavigationMenu(),
            );
        }
      },
    );
  }
}
