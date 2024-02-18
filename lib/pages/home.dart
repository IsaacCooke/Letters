// External imports
import 'package:flutter/material.dart';

// Local imports
import 'package:letters/games/blend.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Select A Game"),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BlendGame())
                )
              },
              child: const Text("Blending Game"),
            ),
          ],
        ),
      ),
    );
  }
}
