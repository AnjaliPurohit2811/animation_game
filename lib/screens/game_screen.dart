import 'package:animation_game/screens/list.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matching Game',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Column(
            children: List.generate(
                5,
                (index) => Draggable(
                    data: imgList1,
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgList[index]))),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(imgList[index]))),
                    ))),
          ),
          Spacer(),
          Column(
            children: List.generate(
                5,
                (index) => DragTarget(
                  onAcceptWithDetails: (details) {
                    if(imgList == imgList1){
                      return
                    }
                  },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgList1[index]))),
                        );
                      },
                    )),
          )
        ],
      ),
    );
  }
}
