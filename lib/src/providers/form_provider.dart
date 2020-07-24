
import 'package:testplm/src/models/form_model.dart';
import 'package:http/http.dart' as http;



class FormSendProvider{
  final url = 'https://plm.com.co/test/users';

  Future<bool> postData (User user) async{
  final resp = await http.post(url,body:{
    'nombre':user.nombre,
    'apellido':user.apellido,
    'tipo_documento':user.tipoDocumento,
    'documento':user.documento,
    'correo':user.correo,
    'celular':user.celular,
    'fecha': user.fechaNacimiento,
    'foto':user.foto
  });

  if(resp.statusCode ==200){
    return true;
  }
  else{
     return false;
  }
  }

}
