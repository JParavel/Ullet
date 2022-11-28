import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_flutter/auth/login.dart';
import '../widgets/widget_auth.dart';
import '../widgets/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _passVer = TextEditingController();

  bool _ocult = true;
  bool _isLoading = false;

  Widget _inputName() {
    return Container(
      child: TextField(
        controller: _name,
        decoration: InputDecoration(hintText: 'Name'),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email'),
      ),
    );
  }

  Widget _inputPass() {
    return Row(children: <Widget>[
      Expanded(
        child: TextField(
            controller: _pass,
            obscureText: _ocult,
            decoration: InputDecoration(hintText: '****', helperText: "Pin")),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextField(
            controller: _pass,
            obscureText: _ocult,
            decoration: InputDecoration(hintText: '****', helperText: "Pin")),
      )
    ]);
  }

  Widget _inputSubmit() {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.send,
          size: 20,
        ),
        label: Text("Register"),
        onPressed: () {
          _registerS();
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
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      wAuthTitle(
                          title: "Register",
                          subtitle: "Register your phone number and pin"),
                      _inputName(),
                      _inputEmail(),
                      _inputPass(),
                      SizedBox(height: 20,),
                      _inputSubmit(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _registerS() async {
    if (_email.text.isNotEmpty &&
        _pass.text.isNotEmpty &&
        _pass.text == _passVer.text) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      wPushReplacement(context, Login());
    } else {
      print("Aqui no rey");
    }
  }
}
