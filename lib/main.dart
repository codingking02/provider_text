import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_text/provider/TextProvider.dart';
import 'package:provider_text/provider/proxyprovider/cartprovider.dart';
import 'package:provider_text/provider/futureproviderdata.dart';
import 'package:provider_text/provider/proxyprovider/greetingserviceprovider.dart';
import 'package:provider_text/provider/savingdataprovider.dart';
import 'package:provider_text/provider/proxyprovider/userprovider.dart';
import 'package:provider_text/provider/valuelistnableprovider.dart';
import 'package:provider_text/screens/proxy_login_ui.dart';
import 'package:provider_text/screens/streamproviderscreen.dart';

//Future Builed make an example
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Future_Provider> getprovider() async {
      Future.delayed(
        Duration(seconds: 5),
      );
      return await Future_Provider("helloz");
    }

    Stream<Future_Provider> getstreamprovider() {
      return Stream<Future_Provider>.periodic(
        const Duration(
          seconds: 5,
        ),
        (computationCount) {
          return Future_Provider("$computationCount");
        },
      ).take(10);
    }

    //String mytext = context.read<TextProvider>().text;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextProvider(),
        ),
        ProxyProvider<UserProvider, GreetingsProvider>(
          update: (context, _value, previous) {
            return GreetingsProvider(userProvider: _value);
          },
        ),
        ProxyProvider2<UserProvider, GreetingsProvider, CartProvider>(
          update: (context, value, value2, previous) {
            return CartProvider(greetingsProvider: value2, userProvider: value);
          },
        ),
        Provider(
          create: (context) => UserProvider(),
        ),
        Provider(
          create: (context) => SaveDataprov(),
        ),
        Provider(
          create: (context) => ValueNotifierProvider(),
        ),
        FutureProvider(
          create: (context) {
            return getprovider();
          },
          initialData: Future_Provider("helloz"),
        ),
        StreamProvider(
          create: (context) => getstreamprovider(),
          initialData: Future_Provider(""),
          child: StreamProvider_ui(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const login(),
      ),
    );
  }
}
