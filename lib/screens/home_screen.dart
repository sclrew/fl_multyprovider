import 'package:fl_multiprovider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultyProvider - first'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Count(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Second screen'),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('decrement_btn'),
            tooltip: 'Subtraction',
            child: const Icon(Icons.remove),
            onPressed: () => context.read<Counter>().substract(),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key('reset'),
            tooltip: 'Reset',
            child: const Icon(Icons.exposure_zero),
            onPressed: () => context.read<Counter>().reset(),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key('increment'),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            onPressed: () => context.read<Counter>().increment(),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Вы нажали кнопку ${context.watch<Counter>().count}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
