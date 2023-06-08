import 'package:provider_text/model/user.dart';

class UserProvider {
  User? _user;
  User get user => _user!;
  setuser(User user) {
    _user = user;
    print('${_user!.email}');
  }
}
