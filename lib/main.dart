import 'package:educadinapi/api.dart';
import 'package:prog_mobile_app_educadin/app/theme/theme.dart';
import 'package:routefly/routefly.dart';
import 'package:flutter/material.dart';

import 'app/pages/login/user_session.dart';
import 'main.route.dart'; // <- GENERATED

part 'main.g.dart'; // <- GENERATED

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userSession.load();
  if (userSession.token != null) {
    defaultApiClient.addDefaultHeader('Authorization', 'Bearer ${userSession.token}');
  }
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
        initialPath: userSession.token != null ? routePaths.pages.core.home : routePaths.pages.login.signin,
        notFoundPath: '/notfound',
      ),
    );
  }
}

