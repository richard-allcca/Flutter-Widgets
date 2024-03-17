import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    // Obtiene el color del contexto definido en main
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Text example response',
                style: TextStyle(color: Colors.white)),
          ),
        ),

        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),
      ],
    );
  }
}

// NOTE - url https://yesno.wtf/api

class _ImageBubble extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif",
        width: size.width * 0.7,
        height: 150,
        // Si le das width y height necesitas 'fit' para que se ajuste el ctn
        fit: BoxFit.cover,
      )
    );
  }
}