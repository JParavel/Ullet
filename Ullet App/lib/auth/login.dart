import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platzi_trip_flutter/auth/register.dart';
import 'package:platzi_trip_flutter/component/colors.dart';

import '../pages/my_home_page.dart';
import '../widgets/widget_auth.dart';
import '../widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _ocult = true;
  bool _isLoading = false;

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Phone'),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  Widget _inputPass() {
    return Stack(children: <Widget>[
      Container(
        child: TextField(
          controller: _pass,
          obscureText: _ocult,
          decoration: InputDecoration(
            hintText: 'Pin',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: IconButton(
            onPressed: () {
              setState(() => _ocult = !_ocult);
            },
            icon: Icon(
              _ocult ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            )),
      )
    ]);
  }

  Widget _inputSubmit() {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainColor
        ),
        icon: Icon(
          Icons.send,
          size: 20,
          textDirection: TextDirection.ltr,
        ),
        label: Text("Login"),
        onPressed: () {
          _loginS();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    wAuthTitle(
                        title: "Login",
                        subtitle: "Enter your email and password"),
                    _inputEmail(),
                    _inputPass(),
                    wForgotPass(context),
                    _inputSubmit(),
                    wRegister(
                      context: context,
                      title: "Register",
                      text: "Dont have an account?",
                      function: Register(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _loginS() async {
    if (_email.text == '123' && _pass.text == '123') {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      wPushReplacement(context, MyHomePage());
    } else {
      print("Aqui no rey");
    }
  }
}
