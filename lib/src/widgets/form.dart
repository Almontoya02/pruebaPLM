
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io' as Io;
import 'package:testplm/src/models/form_model.dart';
import 'package:testplm/src/providers/form_provider.dart';
import 'package:testplm/src/widgets/InputText.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class FormSend extends StatefulWidget {
  @override
  _FormSendState createState() => _FormSendState();
}

class _FormSendState extends State<FormSend> {

  GlobalKey<FormState> _formKey = GlobalKey(); 
  _submit(){
    final send =_formKey.currentState.validate(); // retorna true si todas las validaciones son correctas
    if(send){
      _senData();
    }
  }
  
  String _fecha="";
  String _fechaSend="";
  String password = "";
  String documento = "";
  String nombre="";
  String apellidos="";
  String correo="";
  String celular ="";
  PickedFile foto;

  String option;
  User user = new User();
  TextEditingController _inputFieldDateController = new TextEditingController();
  
  List _tipoDocumento = ['CC','Pasaporte','Extranjeria'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: 300,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: size.width * 0.049),
              InputText(
                  label: "NOMBRES",
                  keyboardType: TextInputType.text,
                  onChanged: (text){
                    nombre= text;
                  },
                  validator: (text){
                    if(text.isEmpty){
                      return "Ingrese un valor";
                    }
                    return null;
                  },
              ),
              InputText(
                  label: "APELLIDOS",
                  keyboardType: TextInputType.text,
                  onChanged: (text){
                    apellidos= text;
                  },validator: (text){
                    if(text.isEmpty){
                      return "Ingrese un valor";
                    }
                    return null;
                  },
              ),
              
              _crearDropdown(),
              InputText(
                  label: "DOCUMENTO DE IDENTIDAD",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text){
                    documento=text;
                  },
                  validator: (text){
                    if(text.isEmpty){
                      return "Ingrese un valor";
                    }
                    return null;
                  },
              ),
              InputText(
                  label: "CORREO ELECTRONICO",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text){
                    correo=text;
                  },
                  validator: (text){
                    if(!text.contains('@') & !text.contains('.')){
                      return "invalid email";
                    }
                    return null;
                  },
              ),
              InputText(
                  label: "CELULAR",
                  keyboardType: TextInputType.phone,
                  onChanged: (text){
                    celular = text; // se asigna el valor
                  },
                  validator: (text){
                    if(text.isEmpty){
                      return "Ingrese un valor";
                    }
                    return null;
                  },
              ),
              _date(),
              _mostrarFoto(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(onPressed:_selectPhoto, child: Icon(Icons.photo_size_select_actual)),
                  FlatButton(onPressed: _takePhoto, child: Icon(Icons.camera_alt))
                ],
              ),
              SizedBox(height: size.width * 0.098,),
              SizedBox(
                  width: size.width * 0.730,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical:size.width * 0.0653),
                    onPressed: (){
                      this._submit();
                    }, 
                    child: Text('Enviar',style: TextStyle(fontSize: size.width * 0.0653),),
                    color: Colors.pinkAccent,
                    textColor: Colors.white
                    ),
                  ),
              SizedBox(height: size.width * 0.0735,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _date() {
    final size = MediaQuery.of(context).size;
    return Container(

      padding: EdgeInsets.all(size.width * 0.049),
      child: TextField( 
             
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        autofocus: false,//para que se abra el teclado al abrir la pagina
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
        hintText: 'Fecha',
        labelText: 'Fecha nacimiento:',
        icon: Icon(Icons.calendar_today),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: new BorderSide(color: Colors.red)
        ),
        ),
        onTap: (){// elimina el focus al seleccionarlo,
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context); 
              }
            ),
    );
  }
    _selectDate(BuildContext context) async {
          DateTime picked = await showDatePicker(
            context: context, 
            initialDate: new DateTime.now(), 
            firstDate: new DateTime(1900), 
            lastDate: new DateTime(2021),
            locale: Locale('es','ES')
          );
          if (picked != null){
            _fecha=DateFormat.yMMMd().format(picked).toString();
            _fechaSend=DateFormat('yyyy-MM-dd').format(picked).toString();
            _inputFieldDateController.text=_fecha;
          }
  }

  _mostrarFoto(){
    
    if(user.foto !=null){
      return Container();
    }else{
      return Image(
        image:AssetImage(foto?.path??'assets/no-image.png'),
        height: 300,
        fit:BoxFit.cover

      );
    }
  }
  _selectPhoto() {
      _procesarImagen(ImageSource.gallery); // se le envia argumento para que acceda a la galeria
  }

  _takePhoto() {
    _procesarImagen(ImageSource.camera);// se envia argumento para que acceda a la camara
  }

  _procesarImagen(ImageSource image) async{
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(
      source: image
    );

    foto=PickedFile(pickedFile.path);
    if(foto != null){
      user.foto=null;
    }
    setState(() {});
  }

  List<DropdownMenuItem<String>> getOptions(){
    List<DropdownMenuItem<String>> list = new List();
    _tipoDocumento.forEach((tipo) { 
      list.add(DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
        ));
    });
    return list;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_drop_up),
        Expanded(
            child: DropdownButton(
            value:option,
            items: getOptions(), 
            onChanged: (opt){
              setState(() {
                option = opt;
              });

            }
          ),
        ),
      ],
    );
  }
  _senData() {
    List<int> imageBytes = Io.File(foto.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes); // convertir imagen a base 64
    //final resp = await FormSendProvider.postData(user);
    // debido a que no hay un endpoint, simularé el envío de la data
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Información enviada correctamente'),
          content: Column(
            children: <Widget>[
              Text(nombre),
              Text(apellidos),
              Text(celular),
              Text(documento)
            ],
          ),
        );
      }
    );

  }
}