import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:provider_text/provider/proxyprovider/cartprovider.dart';
import 'package:provider_text/provider/proxyprovider/userprovider.dart';
import '../provider/proxyprovider/greetingserviceprovider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProxyProvider<UserProvider, GreetingsProvider>(
              update: (context, value, previous) {
                return GreetingsProvider(userProvider: value);
              },
              builder: (context, child) {
                return ProxyProvider2<UserProvider, GreetingsProvider,
                    CartProvider>(
                  update: (context, value, value2, previous) {
                    return CartProvider(
                        greetingsProvider: value2, userProvider: value);
                  },
                  builder: (context, child) {
                    return Text(
                      "user name : ${context.watch<CartProvider>().userProvider.user.email} ",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ProxyProvider<UserProvider, GreetingsProvider>(
              update: (context, value, previous) {
                return GreetingsProvider(userProvider: value);
              },
              builder: (context, child) {
                return ProxyProvider2<UserProvider, GreetingsProvider,
                    CartProvider>(
                  update: (context, value, value2, previous) {
                    return CartProvider(
                        greetingsProvider: value2, userProvider: value);
                  },
                  builder: (context, child) {
                    return Text(
                      "Greeting  ${context.watch<CartProvider>().greetingsProvider.greeting}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
