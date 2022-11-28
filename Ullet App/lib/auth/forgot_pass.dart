import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/colors.dart';
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

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
            hintText: 'Celular', helperText: "Escriba su celular",
          hintStyle: TextStyle(
              color: AppColor.selectColor.withOpacity(0.5), fontWeight: FontWeight.bold),
          helperStyle: TextStyle(
              color: AppColor.selectColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _inputSubmit() {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.mainColor),
        icon: Icon(
          Icons.send,
          size: 20,
        ),
        label: Text("Enviar"),
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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  _mainBackground(context),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        wAuthTitle(
                            title: "Olvido su pin",
                            subtitle:
                                "Escriba su numero telefonico asociado a su cuenta\n"
                                "Se le enviara un enlace para recuperar   "
                                "\nsu pin de seguridad"),
                        _inputEmail(),
                        SizedBox(
                          height: 20,
                        ),
                        _inputSubmit(),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  _mainBackground(BuildContext context) {
    return Positioned(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("images/background.png"))),
    ));
  }

  void _loginS() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      wShowToast(
          msg: "Correo enviado, por favor registra tu bandeja de entrada");
      Navigator.pop(context);
    } else {
      print("Aqui no rey");
    }
  }
}
