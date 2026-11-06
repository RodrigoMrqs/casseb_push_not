import 'package:flutter/material.dart';

import '../models/evento.dart';
import 'detalhes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda Casseb')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: eventos.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final e = eventos[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.event),
              title: Text(e.titulo),
              subtitle: Text('${e.data}\n${e.local}'),
              isThreeLine: true,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DetalhesScreen(evento: e)),
              ),
            ),
          );
        },
      ),
    );
  }
}
