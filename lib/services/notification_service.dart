import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../models/evento.dart';
import '../screens/detalhes_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// Handler para mensagens com o app em segundo plano/encerrado.
/// Mensagens com campo "notification" são exibidas pelo próprio sistema.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {}

class NotificationService {
  /// Chave do dado (data payload) que identifica o evento a ser aberto.
  static const String chaveEvento = 'eventoId';

  static Future<void> init() async {
    final fcm = FirebaseMessaging.instance;

    // Android 13+: solicita permissão de notificações.
    await fcm.requestPermission();

    // Identificador do dispositivo (útil para enviar teste a um aparelho).
    fcm.onRegistered.listen((id) => debugPrint('FCM REGISTRO: $id'));
    await fcm.register();

    // App em primeiro plano: o sistema não mostra a notificação,
    // então exibimos um aviso dentro do app com opção de abrir o evento.
    FirebaseMessaging.onMessage.listen((message) {
      final n = message.notification;
      messengerKey.currentState?.showSnackBar(SnackBar(
        content: Text('${n?.title ?? 'Notificação'}\n${n?.body ?? ''}'),
        duration: const Duration(seconds: 6),
        action: _evento(message) == null
            ? null
            : SnackBarAction(label: 'ABRIR', onPressed: () => _navegar(message)),
      ));
    });

    // App em segundo plano: usuário toca na notificação.
    FirebaseMessaging.onMessageOpenedApp.listen(_navegar);

    // App encerrado: iniciado pelo toque na notificação.
    final inicial = await fcm.getInitialMessage();
    if (inicial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _navegar(inicial));
    }
  }

  static Evento? _evento(RemoteMessage m) =>
      buscarEvento(m.data[chaveEvento]?.toString());

  static void _navegar(RemoteMessage message) {
    final evento = _evento(message);
    if (evento == null) return; // sem eventoId: apenas abre o app
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => DetalhesScreen(evento: evento)),
    );
  }
}
