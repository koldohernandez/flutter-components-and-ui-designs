import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class AlertPage extends StatelessWidget 
{
  
  final String title;


  AlertPage({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }


  void _mostrarAlerta(BuildContext context)
  {

    showDialog(
      context: context,
      barrierDismissible: true, // para cerrar la alerta pinchando fuera de ella
      builder: (context) {

        return AlertDialog(
          title: Text('Titulo de la alerta'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la alerta'),
              FlutterLogo( size: 100.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () { Navigator.of(context).pop(); },
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () { Navigator.of(context).pop(); },
            )
          ],
        );

      }
    );

  }

}