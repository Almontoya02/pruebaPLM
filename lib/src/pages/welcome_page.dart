import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String termsConditions ="www.PLM.com.co garantiza que la información personal que usted envía cuenta con la seguridad necesaria. Los datos ingresados por usuario o en el caso de requerir una validación de los pedidos no serán entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales."
                          "La suscripción a boletines de correos electrónicos publicitarios es voluntaria y podría ser seleccionada al momento de crear su cuenta."
                          "PLM reserva los derechos de cambiar o de modificar estos términos sin previo aviso."
                          "INFORMACIÓN RELEVANTE Es requisito necesario para la adquisición de los productos que se ofrecen en este sitio, que lea y acepte los siguientes Términos y Condiciones que a continuación se redactan. El uso de nuestros servicios así como la compra de nuestros productos implicará que usted ha leído y aceptado los Términos y Condiciones de Uso en el presente documento. Todas los productos  que son ofrecidos por nuestro sitio web pudieran ser creadas, cobradas, enviadas o presentadas por una página web tercera y en tal caso estarían sujetas a sus propios Términos y Condiciones. En algunos casos, para adquirir un producto, será necesario el registro por parte del usuario, con ingreso de datos personales fidedignos y definición de una contraseña."
                          "El usuario puede elegir y cambiar la clave para su acceso de administración de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para la compra de alguno de nuestros productos. www.PLM.com.co no asume la responsabilidad en caso de que entregue dicha clave a terceros."
                          "Todas las compras y transacciones que se lleven a cabo por medio de este sitio web, están sujetas a un proceso de confirmación y verificación, el cual podría incluir la verificación del stock y disponibilidad de producto, validación de la forma de pago, validación de la factura (en caso de existir) y el cumplimiento de las condiciones requeridas por el medio de pago seleccionado. En algunos casos puede que se requiera una verificación por medio de correo electrónico."
                          "Los precios de los productos ofrecidos en esta Tienda Online es válido solamente en las compras realizadas en este sitio web."
                          "LICENCIA PLM  a través de su sitio web concede una licencia para que los usuarios utilicen  los productos que son vendidos en este sitio web de acuerdo a los Términos y Condiciones que se describen en este documento."
                          "USO NO AUTORIZADO En caso de que aplique (para venta de software, templetes, u otro producto de diseño y programación) usted no puede colocar uno de nuestros productos, modificado o sin modificar, en un CD, sitio web o ningún otro medio y ofrecerlos para la redistribución o la reventa de ningún tipo."
                          "PROPIEDAD Usted no puede declarar propiedad intelectual o exclusiva a ninguno de nuestros productos, modificado o sin modificar. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ningún tipo de garantía, expresa o implícita. En ningún esta compañía será  responsables de ningún daño incluyendo, pero no limitado a, daños directos, indirectos, especiales, fortuitos o consecuentes u otras pérdidas resultantes del uso o de la imposibilidad de utilizar nuestros productos."
                          "POLÍTICA DE REEMBOLSO Y GARANTÍA"
                          "En el caso de productos que sean  mercancías irrevocables no-tangibles, no realizamos reembolsos después de que se envíe el producto, usted tiene la responsabilidad de entender antes de comprarlo.  Le pedimos que lea cuidadosamente antes de comprarlo. Hacemos solamente excepciones con esta regla cuando la descripción no se ajusta al producto. Hay algunos productos que pudieran tener garantía y posibilidad de reembolso pero este será especificado al comprar el producto. En tales casos la garantía solo cubrirá fallas de fábrica y sólo se hará efectiva cuando el producto se haya usado correctamente. La garantía no cubre averías o daños ocasionados por uso indebido. Los términos de la garantía están asociados a fallas de fabricación y funcionamiento en condiciones normales de los productos y sólo se harán efectivos estos términos si el equipo ha sido usado correctamente. Esto incluye:"
                          "– De acuerdo a las especificaciones técnicas indicadas para cada producto."
                          "– En condiciones ambientales acorde con las especificaciones indicadas por el fabricante."
                          "– En uso específico para la función con que fue diseñado de fábrica."
                          "– En condiciones de operación eléctricas acorde con las especificaciones y tolerancias indicadas.";
  bool selection = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }

  Widget _body() {
    final size = MediaQuery.of(context).size;
    return Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(size.width * 0.0367),
                  child: Text('!BIENVENIDO!',style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * 0.0735),)
                ),
                Container(
                  margin: EdgeInsets.all(size.width * 0.007),
                  child: Text('Terminos y Condiciones',style: TextStyle(fontWeight: FontWeight.w500, fontSize: size.width * 0.0535),)
                ),

                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(230, 230, 250, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(size.width * 0.0245))
                    ),
                    height: size.width * 0.97,
                    width: size.width * 0.8575,
                    child: SingleChildScrollView(padding: EdgeInsets.all(size.width * 0.002205), child: Text(termsConditions, style: TextStyle(fontSize: size.width * 0.0441),)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.0367),
                      child: Checkbox(
                        value: selection, 
                        onChanged: (bool value){
                          setState(() {
                            selection = !selection;
                          });
                        } 
                      ),
                    ),
                    Container(
                      child:Text('Aceptar Terminos y condiciones', style: TextStyle(fontWeight: FontWeight.bold),)
                    )
                  ],
                ),
                Center(
                  child: FlatButton(
                    color: Colors.blueAccent,
                    onPressed: (){
                      if(selection){
                        Navigator.pushNamed(context,'form');
                      }else{
                        _notification();
                      }
                    }, 
                    textColor: Colors.white,
                    child: Container(
                      width: size.width * 0.245,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Continuar'),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    )
                  ),
                ),

              ],
            ),
          ),
      );
  }
    _notification() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Por favor acepte terminos y condiciones'),
          actions: <Widget>[
            FlatButton(
              onPressed: Navigator.of(context).pop, 
              child: Text('Cerrar')
            )
          ],
        );
      }
    );
  }

}