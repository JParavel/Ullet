import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../component/colors.dart';
import '../pages/my_home_page.dart';
import '../widgets/large_buttons.dart';
import '../widgets/widget_auth.dart';
import '../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  bool _isLoading = false;

  Widget _inputEmail(){
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
            hintText: 'Email',
          helperText: "Escribe tu email"
        ),
      ),
    );
  }

  Widget _inputSubmit(){
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainColor
        ),
        icon: Icon(Icons.send,size: 20,),
        label: Text("Send"),
        onPressed: (){
          _loginS();
        } ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading?
      wAppLoading():Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              wAuthTitle(
                  title: "Forgot Password",
                  subtitle: "Enter your email and password\ 'll send you a link"
                      "\nto reset your password "
              ),
              _inputEmail(),
              _inputSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  void _loginS() async {
    if(_email.text.isNotEmpty){
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      wShowToast(msg: "Email sended, please check your inbox");
      Navigator.pop(context);
    }else{
      print("Aqui no rey");
    }
  }

}
