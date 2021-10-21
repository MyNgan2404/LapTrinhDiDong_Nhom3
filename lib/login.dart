import 'package:flutter/material.dart';
class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage() ,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Login to system"),),
      body: Form(
        child: Column(
          children: [
            Text("Login", style: TextStyle(fontSize: 30),),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Please enter your username",
                labelText: "User name"
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock_open),
                hintText: "Please enter your password",
                labelText: "Password",
              ),
              obscureText: true,
            ),
            ElevatedButton(onPressed: (){}, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
