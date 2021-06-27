import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/Buttons.dart';
import 'package:movie_db/custom_widgets/Textfields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            top: 50,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                      Textfields(
                        label: 'Username',
                        controller: this.usernameController,
                        icon: Icons.person,
                        obscure: false,
                      ),
                      Textfields(
                          label: 'Password',
                          controller: this.passwordController,
                          icon: Icons.settings,
                          obscure: true),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Testing',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        height: 40,
                        width: 130,
                        text: 'Daftar',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
