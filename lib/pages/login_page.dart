import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final phone = TextEditingController();
  final university = TextEditingController();
  final name = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = "Bem Vindo";
        actionButton = "Login";
        toggleButton = "Ainda nao tem conta? cadastre-se agora";
      } else {
        titulo = "Crie sua conta";
        actionButton = "Sign in ";
        toggleButton = "Voltar ao Login ";
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(
          email.text, senha.text, name.text, phone.text, university.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preencha o email corretamente";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Passoword",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preencha sua senha";
                      } else if (value.length < 6) {
                        return "A senha tem que ter mais que 6 caracteres";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: Visibility(
                    visible: !isLogin,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nome",
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Preencha o nome";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Visibility(
                    visible: !isLogin,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Telemovel",
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Prencha o numero de telemovel";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Visibility(
                    visible: !isLogin,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: TextFormField(
                        controller: university,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Universidade",
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Prencha a universidade";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          registrar();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            actionButton,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
