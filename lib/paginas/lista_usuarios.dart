import 'package:examen_ordinario/paginas/editar_usuario.dart';
import 'package:examen_ordinario/paginas/login.dart';
import 'package:examen_ordinario/paginas/registrar_usuario.dart';
import 'package:examen_ordinario/servicios/services_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListaUsuarios extends StatefulWidget {
  static String id = "lista_usuarios";
  const ListaUsuarios({Key key}) : super(key: key);

  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  final pantallas = const <Widget>[
    PaginaUsuarios(),
  ];
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int paginaActual = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
            title: const Text('Lista de estudiantes')),
        body: StreamBuilder<User>(
          stream: firebaseAuth.authStateChanges(),
          builder: (((context, snapshot) {
            if (snapshot.hasData) {
              return pantallas[paginaActual];
            } else {
              return const Center(
                // child: CircularProgressIndicator(),
                child: Text("No hay estudiantes registrados"),
              );
            }
          })),
        ),
      ),
    );
  }
}

class PaginaUsuarios extends StatefulWidget {
  const PaginaUsuarios({Key key}) : super(key: key);

  @override
  State<PaginaUsuarios> createState() => _PaginaUsuariosState();
}

class _PaginaUsuariosState extends State<PaginaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUsuarios(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 10.0, right: 10, left: 20),
                      child: Column(
                        children: [
                          Image.network(
                            snapshot.data[index]['foto'],
                            width: 100,
                            alignment: Alignment.center,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Nombre del becado: ${snapshot.data[index]['nombre']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Numero de cuenta: ${snapshot.data[index]['nocuenta']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Beca: ${snapshot.data[index]['beca']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: (() {
                                        firestore
                                            .collection('usuarios')
                                            .doc(snapshot.data[index]["id"])
                                            .get()
                                            .then((doc) {
                                          if (doc.exists) {
                                            doc.reference.delete();
                                            setState(() {});
                                          }
                                        });
                                      })),
                                  IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: (() async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditarUsuario(
                                                        userID:
                                                            snapshot.data[index]
                                                                ["id"])));
                                        setState(() {});
                                        // Navigator.pop(context);
                                      })),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          }
        }),
      ),
      persistentFooterButtons: [
        MaterialButton(
            onPressed: () async {
              await Navigator.pushNamed(context, RegistrarUsuario.id);
              setState(() {});
            },
            child: Container(
                width: 1000,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Agregar Estudiante Becado',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ))),
        MaterialButton(
            onPressed: () async {
              final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
              await firebaseAuth.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, Login.id);
            },
            child: Container(
              width: 1000,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Cerrar Sesión',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}
