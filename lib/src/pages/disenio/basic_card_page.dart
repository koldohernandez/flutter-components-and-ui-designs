import 'package:flutter/material.dart';


class BasicCardPage extends StatelessWidget 
{
  
  final String title;
  
  
  BasicCardPage ({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2()
        ],
      ),
    );
  }

  /*
    Uso del widget Card
  */
  Widget _cardTipo1() 
  {
    return Card(
      elevation: 2.0, // Sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: Column(
        children: <Widget>[
          ListTile(  
            leading: Icon(Icons.image),
            title: Text('Este es el título del card'),
            subtitle: Text('Este es el subtítulo de la tarjeta y que puede contener tanto texto como queramos. Vemos que puede ser tan largo como queramos.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () { print('Pulsa Cancelar'); },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () { print('Pulsa OK'); },
              ),
            ],
          )
        ],
      ),
    );
  }


  /*
    Custom Card: no es un widget de tipo Card sino que es un Container personalizado
  */
  Widget _cardTipo2() 
  {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage( 
            image: NetworkImage('https://eyesofodysseus.files.wordpress.com/2013/05/monumental-reflections.jpg'),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Este es el texto de la imagen')
          )
        ],
      )
    );


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 0.5,
            offset: Offset(0.0, 1.0), // Mover la sombra en base a las coordenadas X e Y (pero invertido)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        //clipper: CustomClipper(reclip: Listenable.merge(listenables)) ,
        child: card
      ),
    );
  }
  

}