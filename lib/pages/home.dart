// External imports
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return (
      const Scaffold (
        body: Text (
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}
