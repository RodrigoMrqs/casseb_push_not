import 'package:flutter/material.dart';

import '../models/evento.dart';

class DetalhesScreen extends StatelessWidget {
  final Evento evento;
  const DetalhesScreen({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(evento.titulo)),
      body: ListView(
        children: [
          Image.network(
            evento.imagem,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const SizedBox(
              height: 220,
              child: Center(child: Icon(Icons.image_not_supported, size: 48)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(evento.titulo,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                Row(children: [
                  const Icon(Icons.schedule, size: 20),
                  const SizedBox(width: 8),
                  Text(evento.data),
                ]),
                const SizedBox(height: 6),
                Row(children: [
                  const Icon(Icons.place, size: 20),
                  const SizedBox(width: 8),
                  Text(evento.local),
                ]),
                const SizedBox(height: 16),
                Text(evento.descricao),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
