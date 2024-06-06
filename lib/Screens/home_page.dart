import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{

  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child:Text("Welcome To HomePage",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
      ),
    );
  }
}