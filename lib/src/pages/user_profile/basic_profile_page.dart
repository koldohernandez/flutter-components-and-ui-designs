import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget 
{
  
  final String title;


  ProfilePage({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              child: Text('KH'),
              //backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/957580013930532864/0nwRwG1u_400x400.jpg'),
              radius: 20.0,
            ),
            //child: Text('KH')
          ),
          /*Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('KH'),
              backgroundColor: Colors.brown,
            ),
          )*/
        ],
      ),
      body: Column(
        children: <Widget>[
          _getProfileImage(),
          Column(
            children: _getUserData()
          )
        ]
      )
    );
  }


  Widget _getProfileImage()
  {
    return FadeInImage(
      image: NetworkImage('https://koldohernandez.com/images/cover.png'),
      placeholder: AssetImage('assets/images/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
    );
  } 


  List<Widget> _getUserData()
  {
    return [
      ListTile(
        title: Text('1625 Main Street Av.',
            style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('My City, CA 99984'),
        leading: Icon(
          Icons.directions,
          color: Colors.blue[500],
        ),
      ),
      Divider(),
      ListTile(
        title: Text('(408) 555-1212',
            style: TextStyle(fontWeight: FontWeight.w500)),
        leading: Icon(
          Icons.phone_iphone,
          color: Colors.blue[500],
        ),
      ),
      Divider(),
      ListTile(
        title: Text('me@koldo.dev'),
        leading: Icon(
          Icons.mail,
          color: Colors.blue[500],
        ),
      ),
      Divider(),
    ];
  }


}