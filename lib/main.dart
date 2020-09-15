import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

enum DiceType {
  FirstDice,
  SecondDice,
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _firstDiceNumber = 1;
  int _secondDiceNumber = 1;
  Widget _getdiceElement(DiceType diceType) {
    String assetImagePath;
    if (diceType == DiceType.FirstDice) {
      assetImagePath = 'images/dice$_firstDiceNumber.png';
    } else {
      assetImagePath = 'images/dice$_secondDiceNumber.png';
    }
    return Expanded(
      child: GestureDetector(
        child: Image.asset(assetImagePath),
        onTap: () {
          if (diceType == DiceType.FirstDice) {
            setState(() {
              do {
                print('1');
                _firstDiceNumber = Random().nextInt(6);
              } while (_firstDiceNumber == 0);
            });
          } else {
            setState(() {
              do {
                print('2');
                _secondDiceNumber = Random().nextInt(6);
              } while (_secondDiceNumber == 0);
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            _getdiceElement(DiceType.FirstDice),
            SizedBox(
              width: 4,
            ),
            _getdiceElement(DiceType.SecondDice),
          ],
        ),
      ),
    );
  }
}
