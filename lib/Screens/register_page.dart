import 'package:expense_tracker_firebase/Blocs/Register_Bloc/register_bloc.dart';
import 'package:expense_tracker_firebase/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

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
      child: Scaffold(
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
                      onHover:(val){},
                      onTap: () {
                        Navigator.pushNamed(context,Routes.signIn);
                      },
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
                      onHover: (val){},
                      onTap: () {},
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
                BlocBuilder<RegisterBloc,RegisterState>(builder:(context,state){
                  if(state is RegisterErrorState){
                    return Text(state.errorMessage,style: const TextStyle(color: Colors.red),);
                  }else{
                    return Container();
                  }
                }),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (val){
                    BlocProvider.of<RegisterBloc>(context).add(RegisterValidateEvent(nameController.text,emailController.text, contactController.text, passController.text, confirmPassController.text));
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter name",
                    icon: Icon(Icons.drive_file_rename_outline),
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (val){
                    BlocProvider.of<RegisterBloc>(context).add(RegisterValidateEvent(nameController.text,emailController.text, contactController.text, passController.text, confirmPassController.text));
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    icon: Icon(Icons.email),
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (val){
                    BlocProvider.of<RegisterBloc>(context).add(RegisterValidateEvent(nameController.text,emailController.text, contactController.text, passController.text, confirmPassController.text));
                  },
                  controller: contactController,
                  decoration: const InputDecoration(
                    hintText: "Enter Mobile Number",
                    icon: Icon(Icons.contact_phone),
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (val){
                    BlocProvider.of<RegisterBloc>(context).add(RegisterValidateEvent(nameController.text,emailController.text, contactController.text, passController.text, confirmPassController.text));
                  },
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    icon: Icon(Icons.lock_outline),
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (val){
                    BlocProvider.of<RegisterBloc>(context).add(RegisterValidateEvent(nameController.text,emailController.text, contactController.text, passController.text, confirmPassController.text));
                  },
                  controller: confirmPassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Re-Enter Password",
                    icon: Icon(Icons.lock),
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 40,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text("Register now"),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
