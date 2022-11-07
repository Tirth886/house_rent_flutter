// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:house_rent/screens/auth/pages/regi_page.dart';
import 'package:flutter/gestures.dart';
import 'package:house_rent/utils/color.dart';
import 'package:house_rent/screens/auth/widgets/btn_widget.dart';
import 'package:house_rent/screens/auth/widgets/herder_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Email", icon: Icons.email),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {},
                          btnText: "LOGIN",
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Registor",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => RegPage(),
                                    ),
                                  ),
                            style: TextStyle(
                                color: orangeColors, fontSize: 14.00)),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
