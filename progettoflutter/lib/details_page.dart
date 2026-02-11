import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Importiamo per accedere alla lista globale
import 'app_router.dart'; 

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La tua Lista')),
      // Se la lista è vuota mostriamo un testo, altrimenti la lista reale
      body: globalTodoList.isEmpty
          ? const Center(child: Text('La lista è ancora vuota.'))
          : ListView.builder(
              itemCount: globalTodoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(globalTodoList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Usiamo setState per aggiornare la pagina dopo l'eliminazione
                      setState(() {
                        globalTodoList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      // NavigationBar coerente con la HomePage
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1, // Siamo sulla lista (indice 1)
        onDestinationSelected: (index) {
          if (index == 0) context.go('/'); // Torna alla Home
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: 'Inserimento'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Visualizza Lista'),
        ],
      ),
    );
  }
}