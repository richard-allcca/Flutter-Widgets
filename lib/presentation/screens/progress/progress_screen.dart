import 'package:flutter/material.dart';

// INFO - Screen to progress bar

class ProgressScreen extends StatelessWidget {

  // Para utilizar rutas con nombre de go-router
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
          SizedBox(height: 30),

          Text('Circular progress indicator infinitely'),
          SizedBox(height: 10),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: Colors.amberAccent),

          SizedBox(height: 20),

          Text('Progress indicator circular and linear static'),
          SizedBox(height: 10),
          _ControllerProgressIndicator(),
          SizedBox(height: 20),

          Text('Circular indicator controlado'),
          SizedBox(height: 10),
          _ControllerProgressIndicatorCircular(),

          SizedBox(height: 20),

          Text('Linear indicator controlado'),
          SizedBox(height: 10),
          _ControllerProgressIndicatorLinear(),
        ],
      ),
    );
  }
}

// Example with progressIndicator static
class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator( value: 0.5,strokeWidth: 2, backgroundColor: Colors.black12),
          SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(value: 0.5,),
          )
        ],
      ),
    );
  }
}

// NOTE
// snapshot es el value emitido por stream.periodic
// stream - flujo de información


// Example with progressIndicator circular dynamic
class _ControllerProgressIndicatorCircular extends StatelessWidget {
  const _ControllerProgressIndicatorCircular();

  // Example with StreamBuilder
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 500), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12
              ),
            ],
          ),
        );
      },
    );
  }
}

// Example with progressIndicator linear dynamic
class _ControllerProgressIndicatorLinear extends StatelessWidget {
  const _ControllerProgressIndicatorLinear();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
}
