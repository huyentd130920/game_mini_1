import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_mini/data/app_color.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:game_mini/models/question_list_model.dart';
import 'package:game_mini/screen/home_screen.dart';
import 'package:game_mini/screen/play_game_screen.dart';

class ResultPlayGame extends StatefulWidget {
  final List<PlayGameModel> listGame;

  const ResultPlayGame({Key? key, required this.listGame}) : super(key: key);

  @override
  _ResultPlayGameState createState() => _ResultPlayGameState();
}

class _ResultPlayGameState extends State<ResultPlayGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Bạn đã làm tốt lắm!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 40,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 40,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Bạn trả lời đúng ${widget.listGame.length / widget.listGame.length} câu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Báo cáo nội dung',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, bottom: 16),
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: widget.listGame.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.listGame[index].noun}"),
                      if(widget.listGame[index].nounCateId != widget.listGame[index].adjCateId) ...{
                        Text("câu trả lời sai")
                      }else ...{
                        SizedBox()
                      }

                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePlay()),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondary3),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.secondary3,
                          size: 50,
                        ),
                      ))),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePlay()),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondary3),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.cached,
                          color: AppColors.secondary3,
                          size: 50,
                        ),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
