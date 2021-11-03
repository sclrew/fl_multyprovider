import 'package:fl_multiprovider/providers/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Это второй экран '),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${context.watch<ShoppingCart>().count}',
            ),
            Text(
              '${context.watch<ShoppingCart>().cart}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_toCart'),
        onPressed: () => context.read<ShoppingCart>().addItem('Bread'),
        tooltip: 'Добавляем позицию в корзину',
        child: const Icon(Icons.add),
      ),
    );
  }
}
