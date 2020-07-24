import 'package:flutter/material.dart';
import 'package:testplm/src/widgets/form.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Formulario')
      ),
      body: SingleChildScrollView(
        child: Container(child: FormSend())
      ),
    );
  }
}