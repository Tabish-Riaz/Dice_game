import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 145, 146, 146),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Dice Game"),
        centerTitle: true,
      ),
      body: Dice(),
    ),
  ));
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int playerOne = 1;
  int playerTwo = 1;
  String result = "";

  void rollDice() {
    setState(() {
      playerOne = Random().nextInt(6) + 1;
      playerTwo = Random().nextInt(6) + 1;
      if (playerOne > playerTwo) {
        result = "Player 1 Wins";
      } else if (playerTwo > playerOne) {
        result = "Player 2 Wins";
      } else {
        result = "Draw";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                MaterialButton(
                  child: Image.asset('images/dice$playerOne.png',
                      height: 150, width: 100),
                  onPressed: () {
                    rollDice();
                  },
                ),
                Text(
                  "Player 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                MaterialButton(
                  child: Image.asset(
                    'images/dice$playerTwo.png',
                    height: 150,
                    width: 100,
                  ),
                  onPressed: () {
                    rollDice();
                  },
                ),
                Text(
                  "Player 2",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
