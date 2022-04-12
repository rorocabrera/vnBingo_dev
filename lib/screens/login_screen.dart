import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnbingo/responsive/main_screen.dart';
import 'package:vnbingo/screens/signup_screen.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/utils.dart';
import 'package:vnbingo/widgets/text_field_input.dart';
import 'package:vnbingo/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontrolador = TextEditingController();
  final TextEditingController _passcontrolador = TextEditingController();
  bool _cargando = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontrolador.dispose();
    _passcontrolador.dispose();
  }

  void logInUser() async {
    setState(() {
      _cargando = true;
    });
    String res = await AuthMethods().logInUser(
        email: _emailcontrolador.text, password: _passcontrolador.text);

    if (res == 'Exito') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Main_Screen(),
      ));
    } else {
      mostrarSnackBar(res, context);
    }
    setState(() {
      _cargando = false;
    });
  }

  void iralSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SvgPicture.asset(
                  'assets/vnbingo_logo_2.svg',
                  height: 200,
                  width: 400,
                ),
                const SizedBox(height: 24),
                EntradaTexto(
                    textEditingController: _emailcontrolador,
                    hintText: 'Introduzca su email',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 24),
                EntradaTexto(
                  textEditingController: _passcontrolador,
                  hintText: 'Password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: logInUser,
                  child: Container(
                    child: _cargando
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: priColor,
                              ),
                            ),
                          )
                        : const Text("Entrar"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: myBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Flexible(
                  child: Container(),
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: const Text('¿Primera vez?  '),
                        padding: const EdgeInsets.symmetric(vertical: 8)),
                    InkWell(
                      onTap: iralSignup,
                      child: Container(
                          child: const Text(
                            'Regístrese',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
