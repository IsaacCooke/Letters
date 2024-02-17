import 'package:flutter/material.dart';

class BlendGame extends StatefulWidget {
  const BlendGame({super.key});

  @override
  State<BlendGame> createState() => BlendGameState();
}

class BlendGameState extends State<BlendGame> {

  final List<String> _target = ["s", "a", "t"];

  final List<String> _shuffledTarget = ["a", "s", "t"];

  List<String> boxText = ["", "", ""];

  int indexReached = 0;

  void _updateText(String c){
    print("Updated at index $indexReached");
    boxText[indexReached] = c;
    if (indexReached >= 2) {
      if (boxText == _target) {
        print("Game complete!");
      } else {
        print("Game failed");
      }
    } else {
      indexReached++;
    }
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
