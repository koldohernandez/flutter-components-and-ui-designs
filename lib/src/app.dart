import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/routes/app_routes.dart';
import 'package:components/src/pages/home_page.dart';


class MyApp extends StatelessWidget 
{
  
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Spanish
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(title: 'Components Demo App'),
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) { // Se dispara sólo cuando la ruta no existe
        return MaterialPageRoute(
            builder: (BuildContext context ) =>  HomePage(title: 'Default Page')
          );
      }
    );
  }

}