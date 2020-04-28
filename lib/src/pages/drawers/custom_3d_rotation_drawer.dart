import 'package:flutter/material.dart';
import 'dart:math' as math;


class CustomRotationDrawer extends StatefulWidget 
{
  final String title;
  
  CustomRotationDrawer({Key key, this.title}) : super(key: key);

  @override
  _CustomRotationDrawerState createState() => _CustomRotationDrawerState();

}


class _CustomRotationDrawerState extends State<CustomRotationDrawer> 
  with SingleTickerProviderStateMixin
{
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 225;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  
  AnimationController _animationController;
  bool _canBeDragged = false;


  @override
  void initState() 
  {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250)
    );

    
  }


  @override
  void dispose() 
  {
    _animationController.dispose();
    
    super.dispose();

  }


  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toogleDrawer() => _animationController.isCompleted ? close() : open();

  
  
  // To determine if we can start opening and closing our drawer 
  void _onDragStart(DragStartDetails details) 
  
  {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;

  }


  // In this method we calculate how width is the gesture the user did and, base on it, 
  // we can add its value to our controller.
  // This is very important because when the controller's value change then the widget will be rebuilt
  void _onDragUpdate(DragUpdateDetails details) 
  {
  
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }

  }


  void _onDragEnd(DragEndDetails details) 
  
  {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) return;

    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);

    } else if (_animationController.value < 0.5) {
      close();

    } else {
      open();
    }

  }



  @override
  Widget build(BuildContext context) 
  {
    double maxSlide = 225.0;
    
    var myChild = Container(color: Colors.yellow);
    
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      onTap: toogleDrawer,
      child: AnimatedBuilder(
          animation: _animationController, 
          builder: (context, _) {
            double animValue = _animationController.value;
            
            return Material(
              color: Colors.blueGrey,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(maxSlide * (animValue - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(math.pi / 2 * (1 - animValue)),
                      alignment: Alignment.centerRight,
                      child: MyDrawer(),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * animValue, 0),
                    child: Transform(
                              transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-math.pi / 2 * animValue),
                      alignment: Alignment.centerLeft,
                      child: myChild
                    ),
                  ),
                  Positioned(
                    top: 4.0 + MediaQuery.of(context).padding.top,
                    left: 4.0 + animValue * maxSlide,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toogleDrawer,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 16.0 + MediaQuery.of(context).padding.top,
                    left: animValue *
                        MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Hello Flutter Europe',
                      style: Theme.of(context).primaryTextTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  )  
                ],
              )
            );

          }
        ),

    );
  }

}


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Colors.blue,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/custom_drawer/flutter_europe_white.png',
                  width: 200,
                ),
                ListTile(
                  leading: Icon(Icons.new_releases),
                  title: Text('News'),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Favourites'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}