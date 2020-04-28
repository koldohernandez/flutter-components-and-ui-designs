/*

  Source: https://github.com/TechieBlossom/simpleanimations/tree/animated_bottom_bar

  Video: https://www.youtube.com/watch?v=yDEwxjybkEM
*/

import 'package:flutter/material.dart';
import 'package:components/src/pages/custom_bottom_bar/animated_bottom_bar.dart';

class CustomBottonBar extends StatefulWidget {

  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Likes",
      iconData: Icons.favorite_border,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _CustomBottonBarState createState() =>
      _CustomBottonBarState();
}


class _CustomBottonBarState extends State<CustomBottonBar> 
{
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Bottom Bar'),
      ),
      body: AnimatedContainer(
        color: widget.barItems[selectedBarIndex].color,
        duration: const Duration(milliseconds: 300),
      ),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(
            fontSize: 14.0,
            iconSize: 24.0
          ),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }),
    );
  }

}