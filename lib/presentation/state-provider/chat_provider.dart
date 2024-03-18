import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messagesList = [
    Message(
      text: 'llegaste?',
      fromWho: FromWho.hers
    ),
    Message(
      text: 'hola gata',
      fromWho: FromWho.me
    ),
    Message(
      text: 'hola perruno',
      fromWho: FromWho.hers
    ),
    Message(
      text: 'acabo de volver',
      fromWho: FromWho.me
    ),
    Message(
      text: 'te espero para la cena',
      fromWho: FromWho.me
    ),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    // Retrasar el envío para ver el scroll
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}
