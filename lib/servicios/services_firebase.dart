import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List usuarios = [];

  CollectionReference usuariosCollection = firestore.collection('usuarios');
  QuerySnapshot usuariosSnapshot = await usuariosCollection.get();
  for (var doc in usuariosSnapshot.docs) {
    usuarios.add(doc.data());
  }

  return usuarios;
}

Future<void> agregarUsuario(
  String name,
  String email,
  String password,
  String beca,
  String id,
  String nocuenta,
  String imagen,
) async {
  await firestore.collection('usuarios').doc(id).set(
    {
      'id': id,
      'nocuenta': nocuenta,
      'nombre': name,
      'email': email,
      'password': beca,
      'beca': beca,
      'foto': imagen,
    },
  );
}

Future<void> editarUsuario(
  String name,
  String email,
  String password,
  String beca,
  String id,
  String nocuenta,
  String imagen,
) async {
  await firestore.collection('usuarios').doc(id).update(
    {
      'id': id,
      'nocuenta': nocuenta,
      'nombre': name,
      'email': email,
      'password': beca,
      'beca': beca,
      'foto': imagen,
    },
  );
}

Future<Map<String, dynamic>> getUsuarioPorID(String id) async {
  // List usuarios = [];

  CollectionReference usersReference = firestore.collection('usuarios');

  QuerySnapshot queryUsers = await usersReference.get();

  for (var doc in queryUsers.docs) {
    if (doc.data()['id'] == id) {
      return doc.data();
    }
  }
  return null;
}
