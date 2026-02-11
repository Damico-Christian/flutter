import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Importiamo le nostre pagine per collegarle ai percorsi
import 'home_page.dart';
import 'details_page.dart';

// Questa lista globale memorizzerà le nostre Todo in memoria
final List<String> globalTodoList = [];

final GoRouter appRouter = GoRouter(
  // Definiamo il percorso iniziale dell'app
  initialLocation: '/', 
  routes: [
    // Rotta per la pagina di inserimento (Home)
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // Rotta per la pagina della lista (Details)
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsPage(),
    ),
  ],
);