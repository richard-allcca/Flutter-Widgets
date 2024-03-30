import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/domain/entities/message.dart';
import 'package:widgets_app/presentation/provider/chat_provider.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/14262264/pexels-photo-14262264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
        ),
        title: const Text('Chat screen'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messagesList.length,
                    // 'Context' contiene el árbol de widgets
                    //'index' la posición del listView que tiene en este punto
                    itemBuilder: (context, index) {
                      final message = chatProvider.messagesList[index];

                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })
              ),
              MessageFieldBox(
                // onValue: chatProvider.sendMessage // simplified
                onValue: (value) => chatProvider.sendMessage(value) // normal
              )
            ],
          ),
      ),
    );
  }
}
