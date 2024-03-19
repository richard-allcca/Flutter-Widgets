import 'package:flutter/material.dart';
import 'package:widgets_app/config/helpers/get_yes_no_answer.dart';
import 'package:widgets_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

 List<Message> messagesList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: 'Vamos?', fromWho: FromWho.hers, imageUrl: 'https://images.pexels.com/photos/14262264/pexels-photo-14262264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  ];

   Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

   Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController
            .position.maxScrollExtent, // tell you to scroll to end
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut); // type animation
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
