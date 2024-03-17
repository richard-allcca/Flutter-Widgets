import 'package:flutter/material.dart';
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
                'https://noticias.animeonegai.com/wp-content/uploads/2023/08/roxy-mushoku-tensei.jpg'),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    itemCount: 50,
                    // 'Context' contiene el árbol de widgets
                    //'index' la posición del listView que tiene en este punto
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble();
                    })
              ),
              const MessageFieldBox()
            ],
          ),
      ),
    );
  }
}
