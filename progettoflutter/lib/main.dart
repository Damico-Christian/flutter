import 'package:flutter/material.dart';
// Importiamo il file che contiene la logica delle rotte
import 'app_router.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usiamo il costruttore .router per integrare GoRouter nell'app
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      // Colleghiamo la configurazione definita in app_router.dart
      routerConfig: appRouter, 
    );
  }
}