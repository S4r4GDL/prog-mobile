import 'package:prog_mobile_app_educadin/app/theme/theme.dart';
import 'package:routefly/routefly.dart';
import 'package:flutter/material.dart';

import 'main.route.dart'; // <- GENERATED

part 'main.g.dart'; // <- GENERATED
void main() {
  runApp(const App());
}

@Main()
class App extends StatelessWidget {
  const App({super.key});

  ThemeData createTheme(BuildContext context, Brightness brightness) {
  return ThemeData(
  colorScheme: ColorScheme.fromSeed(
  seedColor: lightColorScheme.primary,
  brightness: brightness,
  ),
  brightness: brightness,
  useMaterial3: true,
  );
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp.router(
  title: 'EducaDin',
  debugShowCheckedModeBanner: false,
  theme: createTheme(context, Brightness.light),
  darkTheme: createTheme(context, Brightness.dark),
  themeMode: ThemeMode.system,
  routerConfig: Routefly.routerConfig(
  routes: routes,
  initialPath: routePaths.pages.login.signin,
  notFoundPath: '/notfound',
  ));
  }
  }

