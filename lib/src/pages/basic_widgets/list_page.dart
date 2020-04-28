import 'package:flutter/material.dart';

import 'dart:async';


class ListPage extends StatefulWidget 
{

  String title = '';

  ListPage({Key key, this.title}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}



class _ListPageState extends State<ListPage> 
{

  List<int> _itemsLista = new List();
  int _lastIndex = 0;

  bool _isLoading = false;

  // Controller para el scroll de la pagina: escuha todos los eventos que tienen que ver con el scroll de la página.
  // Cuando entramos y salimos de la página, estamos creando un controller nuevo. Por tanto, hay que tener en cuenta que 
  // cada controller debemos de eliminarlo cuando nos vamos fuera de la pantalla actual.
  // Esto lo haremos cuando se ejecute el `dispose`.
  ScrollController _scrollController = new ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
      );
  }



  // Método que se ejecuta sólo UNA VEZ cuando se carga la página, es decir, al inicio de la misma 
  @override
  void initState() 
  { 
    super.initState();
    
    _pintar10();

    _scrollController.addListener( () {
      // Cuando llegue al final de la página...
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_pintar10();
        _fetchData();
      }
    });

  }


  // Método que se ejecuta cuando la página es destruida
  @override
  void dispose() 
  { 
    super.dispose();
    _scrollController.dispose();
  }



  Widget _crearLista()
  {
    
    // Lista de items
    /*return ListView.builder(
      itemCount: _itemsLista.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, index) => _pintarTarjeta(index)
    );*/


    // Lista de items con Pull to Refresh
    return RefreshIndicator(
      onRefresh: _refreshData, // Lo pasamos por referencia
      child: ListView.builder(
        itemCount: _itemsLista.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, index) => _pintarTarjeta(index)
      ),
    );

  }


  Widget _pintarTarjeta(int index) 
  {
    int numeroImagen = _itemsLista[index];
        
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(15.0), 
                  topRight: Radius.circular(15.0)
                ),
                child: FadeInImage(
                  image: NetworkImage('https://picsum.photos/500/300?random=$numeroImagen'),
                  placeholder: AssetImage('assets/images/jar-loading.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              )
            ),
            ListTile(  
              title: Text('Este es el título del tarjeta!'),
              subtitle: Text('Este es el subtítulo de la tarjeta y que puede contener tanto texto como queramos. Vemos que puede ser tan largo como queramos.'),
              contentPadding: EdgeInsets.all(15.0),
            ),
          ],
        ),
      ),
    );
  }


  void _pintar10()
  {
    for (int i=0; i<10; i++) {
      _lastIndex++;
      _itemsLista.add(_lastIndex);
    }

    setState(() {});
  }


  Future _fetchData() async
  {
    // Simulamos un delay antes de pintar los siguientes registros... lo tipico en peticiones HTTP.
    // De esta forma vamos a poner un icono "Cargando" mientras recibimos los datos.
    _isLoading = true;
    setState(() {});

    final Duration _duration = new Duration(seconds: 2);
    return new Timer(_duration, respuestaHTTP); // Lo pasamos por referencia porque si no lo ejecutaría en ese instante
  }


  void  respuestaHTTP()
  {
    _isLoading = false;
    _pintar10();

    // Hacemos que el scroll se mueva un poco hacia abajo para los nuevos elementos cargados
    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn
    );
  }


  Widget _crearLoading()
  {
    if (_isLoading) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );

    } else {
      return Container();
      
    }
  }



  Future _refreshData() async
  {
    final Duration _duration = new Duration(seconds: 2);
    new Timer(_duration, () {

      _itemsLista.clear();
      _lastIndex++;
      _pintar10();

    }); 

    return Future.delayed(_duration);
  }

}