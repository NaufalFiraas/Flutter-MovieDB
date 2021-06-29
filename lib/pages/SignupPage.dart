import 'package:flutter/material.dart';
import 'package:movie_db/SharedPreference/GetUser.dart';
import 'package:movie_db/custom_widgets/Buttons.dart';
import 'package:movie_db/custom_widgets/Textfields.dart';
import 'package:movie_db/shared_states/Alerts.dart';
import 'LoginPage.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          child: ChangeNotifierProvider(
            create: (context) => Alerts(),
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
                Consumer<Alerts>(
                  builder: (context, alerts, _) => Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      alerts.alert,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<Alerts>(
                          builder: (context, alerts, _) => GestureDetector(
                            child: Buttons(
                              height: 40,
                              width: 130,
                              text: 'Daftar',
                            ),
                            onTap: () {
                              User.getUser(
                                      userKey:
                                          '${this.usernameController.text}Data',
                                      passwordKey:
                                          '${this.passwordController.text}Data')
                                  .then((value) {
                                if (this.usernameController.text == '' ||
                                    this.passwordController.text == '') {
                                  // this.alert = 'Isikan username dan password!';
                                  alerts.alert = 'Isikan username dan password!';
                                } else {
                                  if (this.usernameController.text ==
                                      value.username) {
                                    // this.alert = 'Username sudah dipakai';
                                    alerts.alert = 'Username sudah dipakai';
                                  } else {
                                    User.saveUser(
                                        userKey:
                                            '${this.usernameController.text}Data',
                                        userValue: this.usernameController.text,
                                        passwordKey:
                                            '${this.passwordController.text}Data',
                                        passwordValue:
                                            this.passwordController.text);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
