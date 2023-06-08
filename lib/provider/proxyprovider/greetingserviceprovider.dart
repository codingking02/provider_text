import 'package:provider_text/provider/proxyprovider/userprovider.dart';

class GreetingsProvider {
  UserProvider userProvider;
  GreetingsProvider({required this.userProvider});
  String get greeting => "Hello : ${userProvider.user.email}";
}
