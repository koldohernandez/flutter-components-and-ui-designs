import 'package:components/src/pages/app_bar/my_app_bar.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget 
{
  final String title;
  
  CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}


class _CustomAppBarState extends State<CustomAppBar> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title, 
        //leftIcon: Icon(Icons.block)
      ),
      body: Center(
        child: Text('lo que sea'),
      ),
    );
  }
}