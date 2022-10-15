import 'package:flutter/material.dart';
import 'package:sos_ab/src/services/login-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  static const String _title = 'Stug och Städ Ab';
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Stug och Städ Ab',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Logga in',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Användare',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lösenord',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //Skulle kunna föra vidare till en glömt lösenord sida
            },
            child: const Text(
              'Glömt lösenord',
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () async {
                  var username = nameController.text;
                  var password = passwordController.text;
                  print(username);
                  print(password);
                  var jwt = await attemptLogIn(username, password);
                  if (jwt != null) {
                    final token = await SharedPreferences.getInstance();
                    var jwt = token.getString('token');
                    print(jwt);
                    // MaterialPageRoute(builder: (context) => HomePage(jwt));
                  } else
                    print("didnt connect");
                },
                child: const Text('Logga in'),
              )),
          // Row(
          //   children: <Widget>[
          //     const Text('Har du inget konto?'),
          //     TextButton(
          //       child: const Text(
          //         'Gör ett nytt konto',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //       onPressed: () {
          //         //Skulle kunna skicka vidare till en ny användare
          //       },
          //     )
          //   ],
          //   mainAxisAlignment: MainAxisAlignment.center,
          // ),
        ],
      )

          // child: ElevatedButton(
          //   onPressed: () {},
          //   child: const Text('Logga in'),
          // ),
          ),
    );
  }
}
