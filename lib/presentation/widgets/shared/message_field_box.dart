import 'package:flutter/material.dart';

// NOTE - Example use to Input and events

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    // final colors = Theme.of(context).colorScheme;

    // DESC Example 1 to style input
    // final outLIneInputBorder = OutlineInputBorder(
    //       borderSide: BorderSide(color: colors.primary ),
    //       borderRadius: BorderRadius.circular(25 )
    // );

    // DESC - Example 2 to style input
    final outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"', // placeholder
        // enabledBorder: outLineInputBorder,
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon:const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        )
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); // click outside, close keyboard
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('changed: $value');
      // },
    );
  }
}