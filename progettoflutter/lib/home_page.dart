import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Importiamo per accedere alla lista globale
import 'app_router.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller per leggere cosa scrive l'utente nel campo di testo
  final TextEditingController _todoController = TextEditingController();

  void _addTodo() {
    // Salviamo il testo togliendo eventuali spazi vuoti inutili
    final String text = _todoController.text.trim();
    
    if (text.isNotEmpty) {
      // Aggiungiamo il compito alla lista globale
      globalTodoList.add(text);
      // Puliamo il campo di testo
      _todoController.clear();
      // Feedback visivo per l'utente
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todo aggiunta!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aggiungi Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                labelText: 'Cosa devi fare?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Salva in lista'),
            ),
          ],
        ),
      ),
      // NavigationBar per spostarsi tra le rotte
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0, // Siamo sulla Home (indice 0)
        onDestinationSelected: (index) {
          if (index == 1) context.go('/details'); // Naviga alla lista
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: 'Inserimento'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Visualizza Lista'),
        ],
      ),
    );
  }
}