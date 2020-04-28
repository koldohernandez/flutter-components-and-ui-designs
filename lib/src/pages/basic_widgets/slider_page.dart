import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget 
{
  String title;

  SliderPage({Key key, this.title}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}


class _SliderPageState extends State<SliderPage> 
{

  double _selectedValue = 50.0;
  bool _blocked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            _pintarImagen()
          ],
        )
      ),
    );
  }


  Widget _crearSlider() 
  {
    return Slider(
      value: _selectedValue,
      label: 'Tamaño de la imagen',
      //divisions: 10,
      min: 50.0,
      max: 350.0,
      onChanged: ( _blocked ? null : (value) {

        setState(() {
          _selectedValue = value;
        });

      }),
    );
  }


  Widget _crearCheckbox()
  {
    return CheckboxListTile(
      value: _blocked,
      title: Text('Bloquear Slider'),
      onChanged: ( valor ) {

        setState(() {
          _blocked = valor;
        });

      },
    );
  }



  Widget _crearSwitch()
  {
    return SwitchListTile(
      value: _blocked,
      title: Text('Bloquear Slider'),
      onChanged: ( valor ) {

        setState(() {
          _blocked = valor;
        });

      },
    );
  }



  Widget _pintarImagen()
  {
    return Expanded(
      child: FadeInImage(
        image: NetworkImage('http://pngimg.com/uploads/superman/superman_PNG77.png'),
        placeholder: AssetImage('assets/images/jar-loading.gif'),
        width: _selectedValue,
        fit: BoxFit.contain,
      )
    );

  }

}