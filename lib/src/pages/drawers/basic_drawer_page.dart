import 'package:flutter/material.dart';

import 'package:components/src/pages/drawers/basic_drawer_navigateTo_page1.dart';
import 'package:components/src/pages/drawers/basic_drawer_navigateTo_page2.dart';


class BasicDrawer extends StatefulWidget 
{

  String title;

  BasicDrawer({Key key, this.title}) : super(key: key);

  _BasicDrawerState createState() => _BasicDrawerState();
}



class _BasicDrawerState extends State<BasicDrawer> 
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Page one to previous'),
              onTap:  () {
                //Navigator.push(context, new MaterialPageRoute(builder: (context) => new HelpPage()));
                Navigator.of(context).pushNamed(BasicDrawerPage1.path);
              }
            ),
            ListTile(
              title: Text('Page two to HOME'),
              onTap: () {
                Navigator.of(context).pushNamed(BasicDrawerPage2.path);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.home), 
          iconSize: 80.0,
          tooltip: 'Click to go home',
          onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/'))
        )
      ),
    );
  }



  

}