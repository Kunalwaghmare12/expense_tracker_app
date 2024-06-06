import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/Login_Bloc/login_bloc.dart';
import '../Routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailValueController = TextEditingController();
  final TextEditingController passValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.blue, Colors.white],
        ),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.white.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onHover: (val) {},
                          onTap: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              // decoration: TextDecoration.underline
                              // shadows: [Shadow(color: Colors.white,offset:Offset(1,2),blurRadius: 1)]
                            ),
                          ),
                        ),
                        const SizedBox(width: 100),
                        InkWell(
                          onHover: (val) {},
                          onTap: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                      if (state is LoginErrorState) {
                        return Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        );
                      } else {
                        return Container();
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginValidateEvent(emailValueController.text,
                                passValueController.text));
                      },
                      controller: emailValueController,
                      decoration: const InputDecoration(
                        hintText: "Enter User name",
                        icon: Icon(Icons.person),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (val) {
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginValidateEvent(emailValueController.text,
                                passValueController.text));
                      },
                      controller: passValueController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        icon: Icon(Icons.lock),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (val) {},
                        ),
                        const Text("Remember Me"),
                        const SizedBox(width: 80), // Add spacing here
                        InkWell(
                          onTap: () {},
                          child: const Text("Forget Password ?"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginSuccessEvent(emailValueController.text,
                                passValueController.text));
                        if (state is LoginSucessState) {
                          Navigator.pushNamed(context, Routes.home);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Text("Sign In"),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
