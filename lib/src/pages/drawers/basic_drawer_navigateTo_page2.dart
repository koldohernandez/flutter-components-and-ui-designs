import 'package:flutter/material.dart';


class BasicDrawerPage2 extends StatelessWidget
{

  final String title;
  static String path = 'drawer-2';


  BasicDrawerPage2({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page Two'),
        leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: 'Menu de navegación',
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          }
        )
      ),
      body: Center(child: Text('Close this page to go HOME')),
    );
  }

}