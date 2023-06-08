import 'package:provider_text/provider/proxyprovider/greetingserviceprovider.dart';
import 'package:provider_text/provider/proxyprovider/userprovider.dart';

class CartProvider {
  UserProvider userProvider;
  GreetingsProvider greetingsProvider;
  CartProvider({required this.greetingsProvider, required this.userProvider});
}
