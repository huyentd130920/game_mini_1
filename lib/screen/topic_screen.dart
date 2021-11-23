import 'package:flutter/material.dart';
import '../data/app_color.dart';
import '../models/question_list_model.dart';
import 'play_game_screen.dart';
import 'play_game_screen.dart';

class TopicScreen extends StatefulWidget {
  final QuestionListModel questionListModel;

  const TopicScreen({Key? key, required this.questionListModel})
      : super(key: key);

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.questionListModel.name!),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondary3),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePlay(
                                id: int.parse(widget.questionListModel.id ?? 's'))));
                  },
                  child: Icon(Icons.arrow_forward, color: AppColors.secondary3),
                )),
          ],
        ),
      ),
    );
  }
}
