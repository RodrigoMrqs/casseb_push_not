# Agenda Casseb — Notificações Push (Flutter + FCM)

App simples de **agenda de eventos acadêmicos** feito para a Atividade Prática 4
(Programação para Dispositivos Móveis). Possui uma tela inicial (lista de eventos)
e uma tela de detalhes. Os dados ficam no código ([lib/models/evento.dart](lib/models/evento.dart)).

Pacotes: `firebase_core` e `firebase_messaging`. Sem backend: as notificações
são enviadas manualmente pelo Firebase Console (plano Spark).

## Finalidade e decisões

O app informa eventos do campus (palestras, hackathon, oficinas, feira de carreiras).
Uma notificação é útil quando algo muda ou exige ação com data marcada:

| Desafio | Situação | Exemplo |
|---|---|---|
| 1 – Simples | Aviso de novos eventos | **"Novos eventos na agenda"** / "Confira as novidades..." |
| 2 – Com imagem | Destaque visual de um evento | **"Semana de Tecnologia"** + imagem do evento |
| 3 – Navegação | Lembrete que leva ao evento | **"Hackathon amanhã!"** → abre os detalhes do evento 2 |

No desafio 3, o dado enviado é `eventoId` (ver [notification_service.dart](lib/services/notification_service.dart)),
que identifica o evento a abrir. A navegação funciona com o app em segundo plano
(`onMessageOpenedApp`) e encerrado (`getInitialMessage`). Com o app aberto, aparece
um aviso interno (SnackBar) com o botão "ABRIR".

## Configuração do Firebase (necessária uma vez)

1. No [Firebase Console](https://console.firebase.google.com) crie um projeto (plano Spark).
2. Adicione um app **Android** com o pacote `com.example.casseb_push_not`.
3. Baixe o `google-services.json` e coloque em `android/app/`.
4. `flutter pub get` e execute no emulador (Android Studio, de preferência imagem **com Google Play**, API 33+).
5. Ao abrir, aceite a permissão de notificações.

## Como testar (Firebase Console → Engajamento → Messaging → Nova campanha → Notificações)

Envie a mensagem de teste para o app (ou use o ID impresso no log como `FCM REGISTRO`)
**com o app em segundo plano** (botão Home do emulador).

1. **Simples:** preencha apenas título e texto.
2. **Imagem:** título, texto e URL da imagem, ex.: `https://picsum.photos/id/0/800/450`.
3. **Navegação:** título e texto + em *Opções adicionais → Dados personalizados*: chave `eventoId`, valor `2` (ids de 1 a 4).
   Toque na notificação com o app em segundo plano e também com ele encerrado.

> A imagem exige internet no emulador. Notificações com o app em primeiro plano
> não são exibidas pelo sistema; o app mostra um SnackBar.
