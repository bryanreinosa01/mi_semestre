import 'package:flutter/material.dart';

import 'mi_semestre_pantalla.dart';
import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'local/app_database.dart';
import 'local/materia_local_data_source.dart';
import 'remote/materia_remote_data_source.dart';
import 'repositories/materia_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remote = MateriaRemoteDataSource(FirebaseFirestore.instance);
  final database = AppDatabase();
  final repository = MateriaRepository(
    local: MateriaLocalDataSource(database),
    remote: remote,
  );
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final MateriaRepository repository;
  const MyApp({super.key, required this.repository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Mensaje de Debug desactivado
      title: 'Mi Semestre',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Mi Semestre', repository: repository),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final MateriaRepository repository;
  const MyHomePage({super.key, required this.title, required this.repository});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indiceSeleccionado = 0;

  Widget _mostrarContenido() {
    if (_indiceSeleccionado == 0) {
      return Image.asset('assets/images/carnet.jpeg', fit: BoxFit.contain);
    } else if (_indiceSeleccionado == 1) {
      return Image.asset('assets/images/u_virtual.jpeg', fit: BoxFit.contain);
    } else if (_indiceSeleccionado == 2) {
      return MiSemestrePantalla(repository: widget.repository);
    } else {
      return Image.asset('assets/images/opciones.jpeg', fit: BoxFit.contain);
    }
  }

  Widget _iconoSeleccionado(IconData icono) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF4DA7A7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icono, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(child: Center(child: _mostrarContenido())),

      bottomNavigationBar: BottomNavigationBar(
        //Botones de navegación inferior
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF4DA7A7),
        unselectedItemColor: Colors.black87,

        currentIndex: _indiceSeleccionado, //Índice del botón seleccionado
        onTap: (int indice) {
          setState(() {
            _indiceSeleccionado = indice;
          });
        },

        items: [
          BottomNavigationBarItem(
            //carnet
            icon: const Icon(Icons.home_outlined),
            activeIcon: _iconoSeleccionado(Icons.home_outlined),
            label: 'Carnet',
          ),

          BottomNavigationBarItem(
            //u virtual
            icon: const Icon(Icons.school_outlined),
            activeIcon: _iconoSeleccionado(Icons.school_outlined),
            label: 'U Virtual',
          ),

          BottomNavigationBarItem(
            //mi semestre
            icon: const Icon(Icons.calculate_outlined),
            activeIcon: _iconoSeleccionado(Icons.calculate_outlined),
            label: 'Mi Semestre',
          ),

          BottomNavigationBarItem(
            //opciones
            icon: const Icon(Icons.more_outlined),
            activeIcon: _iconoSeleccionado(Icons.more_horiz),
            label: 'Opciones',
          ),
        ],
      ),
    );
  }
}
