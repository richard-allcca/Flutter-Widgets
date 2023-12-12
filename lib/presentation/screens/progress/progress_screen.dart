import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: Colors.amberAccent),

          // Progress controlado
          SizedBox(
            height: 20,
          ),
          Text('Circular indicator controlado'),
          SizedBox(
            height: 10,
          ),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  // Example with StreamBuilder
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) { // snapshot - valor emitido por stream

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12
              ),
              const SizedBox(width: 20),
              Expanded( // Similar a Flex:1 le indica crecer en el ctn del padre
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // REVIEW - Example without StreamBuilder
  // @override
  // Widget build(BuildContext context) {
  //   return const Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         CircularProgressIndicator( value: 0.5,strokeWidth: 2, backgroundColor: Colors.black12),
  //         SizedBox(width: 20),
  //         Expanded( // Similar a Flex:1 le indica crecer en el ctn del padre
  //           child: LinearProgressIndicator(value: 0.5,),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
