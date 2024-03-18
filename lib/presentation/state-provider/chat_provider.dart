import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messagesList = [
    Message(
      text: 'hola gata',
      fromWho: FromWho.me
    ),
    Message(
      text: 'acabo de volver',
      fromWho: FromWho.hers
    ),
    Message(
      text: 'te espero para la cena',
      fromWho: FromWho.hers
    ),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    notifyListeners();
  }
}
