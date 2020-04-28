
import 'package:flutter/material.dart';
import 'dart:math';


class AnimationPage extends StatefulWidget 
{
  final String title;

  AnimationPage({Key key, this.title}) : super(key: key);

  _AnimationPageState createState() => _AnimationPageState();
}


class _AnimationPageState extends State<AnimationPage> 
{
  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.brown; 

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: Duration( milliseconds: 500 ),
          curve: Curves.easeOutQuad,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow ),
        onPressed: _animateContainer
      ),
    );
  }


  void _animateContainer() 
  {

    Random random = new Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1
      );
      _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble());

    });

  }





}