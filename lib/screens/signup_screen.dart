import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnbingo/responsive/main_screen.dart';
import 'package:vnbingo/screens/login_screen.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/utils.dart';
import 'package:vnbingo/widgets/text_field_input.dart';
import 'package:vnbingo/resources/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontrolador = TextEditingController();

  final TextEditingController _passcontrolador = TextEditingController();
  final TextEditingController _passvericontrolador = TextEditingController();
  bool _cargando = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontrolador.dispose();
    _passcontrolador.dispose();
    _passvericontrolador.dispose();
  }

  void singUpuser() async {
    setState(() {
      _cargando = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailcontrolador.text,
      password: _passcontrolador.text,
      password2: _passvericontrolador.text,
      saldo: 0,
      cartera: ' ',
    );

    setState(() {
      _cargando = false;
    });
    if (res != 'Usuario registrado satisfactoriamente') {
      mostrarSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Main_Screen(),
      ));
    }
  }

  void iralLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(),
                      flex: 1,
                    ),
                    SvgPicture.asset(
                      'assets/vnbingo_logo_2.svg',
                      height: 200,
                      width: 400,
                    ),
                    const SizedBox(height: 8),
                    EntradaTexto(
                        textEditingController: _emailcontrolador,
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(height: 8),
                    EntradaTexto(
                      textEditingController: _passcontrolador,
                      hintText: 'Clave',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 8),
                    EntradaTexto(
                      textEditingController: _passvericontrolador,
                      hintText: 'Confirme su Clave',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: singUpuser,
                      child: Container(
                        child: _cargando
                            ? const Center(
                                child: SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    color: priColor,
                                  ),
                                ),
                              )
                            : const Text("Registrarse"),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: myBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Container(),
                      flex: 3,
                    ),
                    InkWell(
                      onTap: iralLogin,
                      child: Container(
                          child: const Text(
                            'Cerrar Cesión',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
