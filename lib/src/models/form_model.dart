import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.nombre,
        this.apellido,
        this.tipoDocumento,
        this.documento,
        this.correo,
        this.celular,
        this.fechaNacimiento,
        this.foto,
    });

    String nombre;
    String apellido;
    String tipoDocumento;
    String documento;
    String correo;
    String celular;
    DateTime fechaNacimiento;
    String foto;

    factory User.fromJson(Map<String, dynamic> json) => User(
        nombre: json["nombre"],
        apellido: json["apellido"],
        tipoDocumento: json["tipo_documento"],
        documento: json["documento"],
        correo: json["correo"],
        celular: json["celular"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "tipo_documento": tipoDocumento,
        "documento": documento,
        "correo": correo,
        "celular": celular,
        "fecha_nacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "foto": foto,
    };
}