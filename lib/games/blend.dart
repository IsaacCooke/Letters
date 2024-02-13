import 'package:flutter/material.dart';

class BlendGame extends StatefulWidget {
  const BlendGame({super.key});

  @override
  State<BlendGame> createState() => BlendGameState();
}

class BlendGameState extends State<BlendGame> {

  final List<String> _target = ["s", "a", "t"];

  final List<String> _shuffledTarget = _target.shuffle();

  List<String> boxText = ["", "", ""];

  void _updateText(String c){
    print("Updated");
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Text(boxText[0]),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Text(boxText[1]),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Text(boxText[2]),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => _updateText(_shuffledTarget[0]),
                child: Text(_shuffledTarget[0])
              ),
              ElevatedButton(
                onPressed: () => _updateText(_shuffledTarget[1]),
                child: Text(_shuffledTarget[1])
              ),
              ElevatedButton(
                onPressed: () => _updateText(_shuffledTarget[2]),
                child: Text(_shuffledTarget[2])
              ),
            ],
          ),
        ],
      ),
    );
  }
}
