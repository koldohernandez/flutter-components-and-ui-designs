import 'package:flutter/material.dart';


class BasicDrawerPage1 extends StatelessWidget
{

  final String title;
  static String path = 'drawer-1';


  BasicDrawerPage1({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page One'),
        leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: 'Menu de navegación',
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('drawer'));
          }
        )
      ),
      body: Center(child: Text('Close this page return to the prevoius page')),
    );
  }

}