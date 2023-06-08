import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/TextProvider.dart';

class changetext_ui extends StatelessWidget {
  const changetext_ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider_Text"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<TextProvider>(
          builder: (context, value, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${value.text}",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TextProvider>().chaangetext();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
