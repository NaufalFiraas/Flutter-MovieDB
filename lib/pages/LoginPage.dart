import 'package:flutter/material.dart';
import 'package:movie_db/SharedPreference/GetUser.dart';
import 'package:movie_db/custom_widgets/Buttons.dart';
import 'package:movie_db/custom_widgets/Textfields.dart';
import 'SearchPage.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String alert = '';


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
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Login',
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
                        obscure: true,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  this.alert,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Buttons(height: 40, width: 130, text: 'Login'),
                        onTap: () {
                          User.getUser(
                                  userKey: '${this.usernameController.text}Data',
                                  passwordKey: '${this.passwordController.text}Data')
                              .then((value) {
                            if (this.usernameController.text == '' ||
                                this.passwordController.text == '') {
                              this.alert = 'Isikan username dan password!';
                              setState(() {});
                            } else {
                              if (value.username == '' && value.password == '') {
                                this.alert = 'User belum terdaftar';
                                setState(() {});
                              } else {
                                if (this.usernameController.text ==
                                        value.username &&
                                    this.passwordController.text ==
                                        value.password) {
                                  this.alert = '';
                                  setState(() {});
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SearchPage(username: value.username,);
                                  }));
                                } else {
                                  this.alert = 'Username / password salah!';
                                  setState(() {});
                                }
                              }
                            }
                          });
                        },
                      ),
                      GestureDetector(
                        child: Buttons(height: 40, width: 130, text: 'Daftar'),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupPage();
                          }));
                        },
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
