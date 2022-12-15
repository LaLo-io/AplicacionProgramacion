import 'package:examen_ordinario/servicios/services_firebase.dart';
import 'package:flutter/material.dart';

class EditarUsuario extends StatefulWidget {
  static String id = "edit_user";
  const EditarUsuario({Key key, this.userID}) : super(key: key);
  final String userID;

  @override
  State<EditarUsuario> createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  final TextEditingController controladorDeUsuario =
      TextEditingController(text: "");
  final TextEditingController controladorDeEmail =
      TextEditingController(text: "");
  final TextEditingController controladorDeContrasena =
      TextEditingController(text: "");
  final TextEditingController controladorDeBeca =
      TextEditingController(text: "");
  final TextEditingController controladorDeFoto =
      TextEditingController(text: "");
  final TextEditingController controladorDeNumeroDeCuenta =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Inventario'),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
          future: getUsuarioPorID(widget.userID),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              controladorDeUsuario.text = snapshot.data["nombre"];
              controladorDeEmail.text = snapshot.data["email"];
              controladorDeContrasena.text = snapshot.data["password"];
              controladorDeBeca.text = snapshot.data["beca"];
              controladorDeFoto.text = snapshot.data["foto"];
              controladorDeNumeroDeCuenta.text = snapshot.data["nocuenta"];
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Edita al usuario ${snapshot.data["nombre"]}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeUsuario,
                                  decoration: const InputDecoration(
                                      labelText: "Nombre del usuario",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeNumeroDeCuenta,
                                  decoration: const InputDecoration(
                                      labelText: "Numero de cuenta",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeEmail,
                                  decoration: const InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeContrasena,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                      labelText: "Contraseña",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeBeca,
                                  decoration: const InputDecoration(
                                      labelText: "Beca",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: controladorDeFoto,
                                  decoration: const InputDecoration(
                                      labelText: "Foto",
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  color: Colors.green,
                                  onPressed: () async {
                                    await editarUsuario(
                                            controladorDeUsuario.text,
                                            controladorDeEmail.text,
                                            controladorDeContrasena.text,
                                            controladorDeBeca.text,
                                            widget.userID,
                                            controladorDeNumeroDeCuenta.text,
                                            controladorDeFoto.text)
                                        .then((_) => {
                                              setState(() {}),
                                              Navigator.pop(context),
                                            });
                                  },
                                  textColor: Colors.white,
                                  child: const Text(
                                    "Editar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
              );
            }
          },
        ),
      ),
    );
  }
}
