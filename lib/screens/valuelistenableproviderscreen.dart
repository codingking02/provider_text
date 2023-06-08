import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/valuelistnableprovider.dart';

class ValueListenableExample extends StatelessWidget {
  const ValueListenableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ui(context);
  }

  ui(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ValueListenableProvider example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Text(
              'Consumer someValue',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<ValueNotifierProvider>(
                builder: (BuildContext _context, value, child) {
              print('Consumer value');
              return ValueListenableProvider<String>.value(
                value: value.myVal,
                child: Text(
                  value.myVal.value,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Consumer<ValueNotifierProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              context.read<ValueNotifierProvider>().doSomething();
              //or value.myval
            },
          );
        },
      ),
    );
  }
}
