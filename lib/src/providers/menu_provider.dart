import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider
{

  List<dynamic> opcionesMenu = [];


  _MenuProvider();


  Future<List<dynamic>> cargarOpcionesMenu() async 
  {
    var datos = await rootBundle.loadString('data/menu_options.json');

    Map dataMap = json.decode( datos );
    
    return dataMap['routes'];
  }

}


/*
  La clase MenuProvider la hacemos privada para devolver sólo una instancia de la misma 
  en toda la aplicación (Singleton)
*/ 
final menuProvider = new _MenuProvider();
