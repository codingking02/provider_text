import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/futureproviderdata.dart';

class StreamProvider_ui extends StatelessWidget {
  const StreamProvider_ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureProvider_ui"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<Future_Provider>(
              builder: (context, value, child) {
                print("Consumer build");
                return Text(value.txt);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<Future_Provider>().dosomethings();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
