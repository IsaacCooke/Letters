// External imports
import 'package:flutter/material.dart';

// Local imports
import 'package:letters/pages/layout.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layout(),
    );
  }
}
