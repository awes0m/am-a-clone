import 'package:ama_clone/constants/global_variables.dart';
import 'package:ama_clone/features/auth/services/auth_service.dart';
import 'package:ama_clone/features/home/screens/home_screen.dart';
import 'package:ama_clone/provider/user_provider.dart';
import 'package:ama_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trxplore Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Trxplore'),
          ),
          body: Provider.of<UserProvider>(context).user.token.isNotEmpty?HomeScreen(): AuthScreen(),
        ));
  }
}
