import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:platzi_trip_flutter/component/colors.dart';

class VerifyNum extends StatefulWidget {
  const VerifyNum({Key? key}) : super(key: key);

  @override
  State<VerifyNum> createState() => _VerifyNumState();
}

class _VerifyNumState extends State<VerifyNum> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendMesgButton() {
    return Column(
      children: <Widget>[
        Text("No  recibiste el mensaje?"),
        TextButton(
            onPressed: () async {
              setState(() => _isLoading = true);
              await Future.delayed(Duration(seconds: 2));
              setState(() {
                _isLoading = false;
                _isSended = true;
              });
            },
            child: Text(_isLoading ? "Enviando..." : "Reenviar")),
      ],
    );
  }

  Widget _resendMesg() {
    return Column(
      children: <Widget>[
        Text(
          "Mensaje enviado!",
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }

  Widget _bottomWidget() {
    return _isSended ? _resendMesg() : _resendMesgButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: AppColor.backGroundColor,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Icon(Icons.drag_handle),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MdiIcons.message,
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Verifica tus mensajes",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Te hemos enviado un mensaje de verificacion a este\n"
                  "numero para poder continuar con el proceso de registro",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                _bottomWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
