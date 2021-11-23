import 'package:flutter/material.dart';
import 'package:game_mini/bloc/list_question_bloc.dart';
import 'package:game_mini/data/app_color.dart';
import 'package:game_mini/models/question_list_model.dart';
import 'package:game_mini/screen/topic_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'play_game_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, String? title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListQuestionBloc bloc = ListQuestionBloc();
  bool isClick = false;

  @override
  void initState() {
    bloc.getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<QuestionListModel>>(
          stream: bloc.listQuestion.stream,
          initialData: bloc.list,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return _buildQuestion(
                  snapshot.data![index],
                );
              },
            );
          }),
    );
  }

  Widget _buildQuestion(QuestionListModel? questionListMode) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopicScreen(questionListModel: questionListMode!)
                    // GamePlay(id: int.parse(questionListMode!.id!))
        ));
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: new Text("Thông báo"),
        //         content: new Text(questionListMode!.name!),
        //         actions: <Widget>[
        //           TextButton(
        //             onPressed: () => Navigator.pop(context, 'OK'),
        //             child: Text("Xác nhận"),
        //           ),
        //         ],
        //       );
        //     });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
          color: AppColors.gray7,
          border: Border.all(),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(5),
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondary3),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  child: Icon(Icons.play_arrow, color: AppColors.secondary3),
                )),
            Text(
              questionListMode!.name ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 6, right: 16),
              width: 120,
              child: LinearPercentIndicator(
                padding: EdgeInsets.zero,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20,
                restartAnimation: false,
                percent: 0.2,
                linearStrokeCap: LinearStrokeCap.roundAll,
                clipLinearGradient: true,
                // linearGradient:
              ),
            ),
          ],
        ),
      ),
    );
  }
}
