import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:provider_text/model/user.dart';
import 'package:provider_text/provider/proxyprovider/userprovider.dart';
import 'package:provider_text/screens/proxy_home_ui.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text(
                  "enter your email",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onChanged: (value) {
                setState(
                  () {
                    email = value;
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "enter your password",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onChanged: (value) {
                setState(
                  () {
                    password = value;
                  },
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserProvider>().setuser(User(email: email));
                Provider.of<UserProvider>(context, listen: false).setuser(
                  User(email: email),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
              child: Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
