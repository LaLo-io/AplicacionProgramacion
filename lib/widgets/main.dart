import 'package:examen_ordinario/firebase_options.dart';
import 'package:examen_ordinario/paginas/editar_usuario.dart';
import 'package:examen_ordinario/paginas/lista_usuarios.dart';
import 'package:examen_ordinario/paginas/login.dart';
import 'package:examen_ordinario/paginas/registrar_usuario.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Ordinario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Login.id,
      routes: {
        Login.id: (_) => const Login(),
        ListaUsuarios.id: (_) => const ListaUsuarios(),
        RegistrarUsuario.id: (_) => const RegistrarUsuario(),
        EditarUsuario.id: (_) => const EditarUsuario(),
      },
    );
  }
}
