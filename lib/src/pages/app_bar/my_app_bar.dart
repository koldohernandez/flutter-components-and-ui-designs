import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget
{

  final String title;

  final Widget leftIcon;
  final Function leftFunction;


  MyAppBar({Key key, @required this.title, this.leftIcon, this.leftFunction}) : super(key: key);



  Size get preferredSize => new Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        color: Colors.red, //.withOpacity(0.7),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell( // Widget para manejar taps, etc..
                onTap: () => leftFunction ?? Navigator.pop(context),
                child: Container(
                  child: leftIcon ?? Icon(Icons.arrow_back_ios),
                ),
              )
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(this.title)
              )
            ),
            Expanded(
              flex: 1,
              child: Container()
            )
          ],
        ),
      )
    );
  
  }

}