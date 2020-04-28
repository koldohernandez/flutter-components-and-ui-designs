import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_utils.dart';

//import 'package:components/src/pages/alert_page.dart';

class HomePage extends StatefulWidget
{
  final String title;


  HomePage({Key key, this.title}) : super(key: key);
   
  @override
  HomePageState createState() => HomePageState();
}
 
class HomePageState extends State<HomePage> 
{
  


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      /*body: WillPopScope(
        onWillPop: _onBackPressed,
        child: _menuList(),
      )*/
      body: _menuList(),
    );
  }



  /* 
    Dynamic Menu 
  */
  Widget _menuList() 
  {
    return FutureBuilder(
      future: menuProvider.cargarOpcionesMenu(),
      initialData: [], // Envia el array vacio al snaphost mientras se resuelve el Future. Si no, peta pq recibe 'null' mientras obtiene los datos
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            
        return ListView(
          children: _getMenuOptions(context, snapshot.data),
        );

      },
    );
  }



  List<Widget> _getMenuOptions(BuildContext context, List<dynamic> data) 
  {  
    final List<Widget> listaBloques = new List<Widget>();

    data.forEach( (bloque) {
      
      final tituloBloque = bloque['tituloBloque'];

      final List<Widget> listaOpcionesMenu = new List<Widget>();

      bloque['opcionesMenu'].forEach( (bloque) 
      {
        final widgetMenuTemp = ListTile(
          title: Text (bloque['text']),
          subtitle: Text(bloque['subtitle']),
          leading: getIcon(bloque['icon']) ,
          trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, bloque['ruta']);

            /*
              Navegación estática
            */
            /*final route = MaterialPageRoute(
              builder: ( context ) =>  AlertPage()
            );
            Navigator.push(context, route);
            */
          },
        );

        listaOpcionesMenu..add(widgetMenuTemp);
      });

      final widgetTemp = ExpansionTile(
          title: Text(tituloBloque),
          trailing: Icon(Icons.more_horiz),
          children: listaOpcionesMenu
        );
   
      listaBloques..add(widgetTemp);

    });

    return listaBloques;
  }


  Future<bool> _onBackPressed() 
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('¿Estás seguro?'),
            content: Text('Vas a cerrar la aplicación!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('SI'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }


}
