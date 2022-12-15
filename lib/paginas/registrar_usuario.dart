import 'package:examen_ordinario/servicios/services_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrarUsuario extends StatefulWidget {
  static String id = "registrar_usuario";
  const RegistrarUsuario({Key key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  final TextEditingController controladorDeUsuario = TextEditingController();
  final TextEditingController controladorDeEmail = TextEditingController();
  final TextEditingController controladorDeContrasena = TextEditingController();
  final TextEditingController controladorDeBeca = TextEditingController();
  final TextEditingController controladorDeID = TextEditingController();
  final TextEditingController controladorDeFoto = TextEditingController();
  final TextEditingController controladorDeNumeroDeCuenta =
      TextEditingController();

  Future registroDeUsuario() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: controladorDeEmail.text.trim(),
        password: controladorDeContrasena.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
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
                        const Text(
                          "Agrega un nuevo usuario",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controladorDeID,
                          decoration: const InputDecoration(
                              labelText: "ID",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controladorDeUsuario,
                          decoration: const InputDecoration(
                              labelText: "Nombre de estudiante becado",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controladorDeEmail,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controladorDeContrasena,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controladorDeBeca,
                          decoration: const InputDecoration(
                              labelText: "Beca",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: controladorDeNumeroDeCuenta,
                          decoration: const InputDecoration(
                              labelText: "Numero de cuenta",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: controladorDeFoto,
                          decoration: const InputDecoration(
                              labelText: "Foto",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          color: Colors.green,
                          onPressed: () async {
                            await agregarUsuario(
                                    controladorDeUsuario.text,
                                    controladorDeEmail.text,
                                    controladorDeContrasena.text,
                                    controladorDeBeca.text,
                                    controladorDeID.text,
                                    controladorDeNumeroDeCuenta.text,
                                    controladorDeFoto.text)
                                .then((_) => {
                                      setState(() {}),
                                      Navigator.pop(context),
                                    });

                            registroDeUsuario();
                          },
                          textColor: Colors.white,
                          child: const Text(
                            "Agregar",
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
      ),
    ));
  }
}
