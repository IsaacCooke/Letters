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

  void _updateText(BuildContext context, String c) {
    print("Updated at index $indexReached");

    setState(() {    
      boxText[indexReached] = c;
   });

    if (indexReached >= 2) {
      if ((boxText[0] == _target[0]) && (boxText[1] == _target[1]) && (boxText[2] == _target[2])) {
        _dialougeBuilder(context);
      } else {
        print("Game failed");
      }
    } else {
      indexReached++;
    }
  }

  Future<void> _dialougeBuilder(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text("You Won!"),
        content: const Text("Press to play again or choose another game"),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,  
            ),
            child: const Text("Return"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text("Play again"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BlendGame())
              );
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blend"),
      ),
      body: Center(
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
                    onPressed: () => _updateText(context, _shuffledTarget[0]),
                    child: Text(_shuffledTarget[0])),
                ElevatedButton(
                    onPressed: () => _updateText(context, _shuffledTarget[1]),
                    child: Text(_shuffledTarget[1])),
                ElevatedButton(
                    onPressed: () => _updateText(context, _shuffledTarget[2]),
                    child: Text(_shuffledTarget[2])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
