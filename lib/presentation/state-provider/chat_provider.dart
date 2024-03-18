import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> message = [
    Message(
      text: 'hola',
      fromWho: FromWho.me
    ),
    Message(
      text: 'mundo',
      fromWho: FromWho.hers
    ),
  ];

  Future<void> sendMessage(String text) async {
    // TODO - Implementar método
  }
}
