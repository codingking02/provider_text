import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_text/provider/savingdataprovider.dart';

class ProviderOnly_ui extends StatelessWidget {
  const ProviderOnly_ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider_Text"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SaveDataprov>(
              builder: (context, value, child) {
                print("Consumer build");
                return Text("${value.sometext}");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SaveDataprov>().changevalue("goodbye");
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
