import 'package:flutter/material.dart';


class InputsPage extends StatefulWidget 
{
  
  final String title;

  InputsPage({Key key, this.title}) : super(key: key);

  _InputsPageState createState() => _InputsPageState();
}


class _InputsPageState extends State<InputsPage> 
{
  
  OutlineInputBorder _inputBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)
  );

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fechaNacimiento = '';

  TextEditingController _inputDateController = new TextEditingController();

  List<String> _selectItems = ['Volar', 'Rayos X', 'Fuerza', 'Aliento'];
  String _opcionSeleccionada = 'Volar';


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        children: <Widget>[
          _crearInputName(),
          Divider(),
          _crearInputEmail(),
          Divider(),
          _crearInputPassword(),
          Divider(),
          _crearInputDate(context), 
          Divider(),
          _crearDropdown(),
          Divider(),
          _printData()
        ],
      ),
    );
  }


  /*
    1 - Input Text
  */ 
  Widget _crearInputName() 
  {
    int _maxValue = 50;

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      maxLength: _maxValue,
      decoration: InputDecoration(
        border: _inputBorderStyle,
        counter: Text('Cantidad de letras ${_nombre.length}'),
        hintText: 'Escribe tu nombre y apellidos',
        labelText: 'Nombre completo',
        helperText: 'Máximo $_maxValue caracteres',
        suffixIcon: Icon (Icons.accessibility),
        //icon: Icon ( Icons.account_circle)
      ),
      onChanged: (value) {
        setState(() {
          _nombre = (value == null ? '' : value);
        });
      },
    );
  }


  /*
    2 - EMAIL 
  */ 
  Widget _crearInputEmail() 
  {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: _inputBorderStyle,
        hintText: 'Escribe tu e-mail',
        labelText: 'Email',
        suffixIcon: Icon (Icons.alternate_email),
        //icon: Icon ( Icons.account_circle)
      ),
      onChanged: (value) {
        setState(() {
          _email = (value == null ? '' : value);
        });
      },
    );
  }


  /*
    3 - PASSWORD
  */ 
  Widget _crearInputPassword() 
  {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: _inputBorderStyle,
        hintText: 'Introduce tu contraseña',
        labelText: 'Password',
        suffixIcon: Icon (Icons.lock_open),
        //icon: Icon ( Icons.account_circle)
      ),
      onChanged: (value) {
        setState(() {
          _password = (value == null ? '' : value);
        });
      },
    );
  }



  /*
    4 - DATE FIELD
  */ 
  Widget _crearInputDate(BuildContext context) 
  {
    return TextField(
      controller: _inputDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: _inputBorderStyle,
        hintText: 'Introduce tu fecha de nacimiento',
        labelText: 'Fª Nacimiento',
        suffixIcon: Icon (Icons.calendar_today),
        //icon: Icon ( Icons.account_circle)
      ),
      onTap: () {
        // Quitar el foco del input
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }


  _selectDate (BuildContext context) async
  {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );  

    if (picked != null) {
      setState( () {
        _fechaNacimiento = picked.toString();
        _inputDateController.text = _fechaNacimiento;
      });
    }
  }



  /*
    5 - DROPDOWN
  */ 
  List<DropdownMenuItem<String>> _crearListaOpciones()
  {
    List<DropdownMenuItem<String>> listaOpciones = new List();
   
    _selectItems.forEach( ( option ) {
      listaOpciones.add(DropdownMenuItem(
        child: Text(option),
        value: option
        ));
    });

    return listaOpciones;
  }


  Widget _crearDropdown()
  {
    return Row(
      children: <Widget>[
        SizedBox(width: 10.0),
        Expanded(
          child: DropdownButton(
            
            value: _opcionSeleccionada,
            items: _crearListaOpciones(),  
            onChanged: (value) { 
             setState(() {
               _opcionSeleccionada = value;
             });
            },
          ),
        ),
      ],
    );

  }


  Widget _printData()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        (_nombre != '' ? Text('Nombre: $_nombre') : Text('Nombre: <vacio>')),
        (_email != '' ? Text('Email: $_email') : Text('Email: <vacio>')),
        (_password != '' ? Text('Pasword: $_password') : Text('Password: <vacio>')),
        (_fechaNacimiento != '' ? Text('Fª Nac.: $_fechaNacimiento') : Text('Fª Nac.: <vacio>')),
        (_opcionSeleccionada != '' ? Text('Poderes: $_opcionSeleccionada') : Text('Poderes: <vacio>')),
      ],
    );

  }


}

