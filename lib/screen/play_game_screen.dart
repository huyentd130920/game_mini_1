import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_mini/bloc/play_game_bloc.dart';
import 'package:game_mini/data/app_color.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:game_mini/screen/result.dart';
import 'package:game_mini/widget/loading_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:swipe_cards/swipe_cards.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({
    Key? key,
    int? id,
  }) : super(key: key);

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  PlayGameBloc bloc = PlayGameBloc();

  List<SwipeItem> _swipeItems = <SwipeItem>[];

  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); //

  List<PlayGameModel> list = [];
  List<PlayGameModel> list2 = [];

  @override
  void initState() {
    bloc.getPlayGame1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [

        StreamBuilder<List<PlayGameModel>>(
            stream: bloc.listQuestion.stream,
            initialData: bloc.list,
            builder: (context, snapshot) {

              list.addAll(snapshot.data?.sublist(0, 11) ?? []);
              // list2.addAll(snapshot.data?.sublist(11, 22) ?? []);

              for (int i = 0; i < snapshot.data!.length; i++) {
                _swipeItems.add(SwipeItem(
                    content: snapshot.data,
                    likeAction: () {
                  // snapshot.data!.forEach((element) { /// sau có APi thì bỏ cmt
                      if(list.length > 10){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ResultPlayGame(
                              listGame: list,
                            )));
                      }else{
                        list.forEach((element) {
                          list2.add(element);
                          if (element.nounCateId == element.adjCateId) {
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text("Liked"),
                              duration: Duration(milliseconds: 500),
                            ));
                          }
                        });
                      }



                }, nopeAction: () {
                  // snapshot.data!.forEach((element) {
                  list.forEach((element) {
                    list2.add(element);
                    print(list2);
                    if (element.nounCateId == element.adjCateId) {
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text("Nope"),
                        duration: Duration(milliseconds: 500),
                      ));
                      print("distList");
                    }
                  });

                }));

                _matchEngine = MatchEngine(swipeItems: _swipeItems);
              }
              // if (snapshot.data?.length == 0) {
                if (list.length == 0) {
                  // nếu listGame = 0 thì báo lỗi
                  return Text("lỗi");
                } else if (snapshot.data!.isEmpty) {
                  return Loading();
                } else
                  return Column(
                    /// ngược thì run
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Colors.blueAccent,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: SwipeCards(
                          matchEngine: _matchEngine,
                          onStackFinished: () {
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text("Stack Finished"),
                              duration: Duration(milliseconds: 500),
                            ));
                          },
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              color: Colors.blueAccent,
                              alignment: Alignment.center,
                              child: Text(
                                // snapshot.data![index].noun ?? "",
                                list[index].noun ?? "",
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 16),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _matchEngine.currentItem?.nope();
                              },
                              child: Text("tính từ")),
                          ElevatedButton(
                              onPressed: () {
                                _matchEngine.currentItem?.like();
                              },
                              child: Text("danh tứ")),
                        ],
                      )
                    ],
                  );
              }
            ),
        Container(
          margin: EdgeInsets.only(top: 60, left: 16),
          width: 120,
          child: LinearPercentIndicator(
            padding: EdgeInsets.zero,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20,
            restartAnimation: false,
            percent: list2.length == 0 ? 0 : 10 /  list2.length,
            linearStrokeCap: LinearStrokeCap.roundAll,
            clipLinearGradient: true,
            // linearGradient:
          ),
        ),
        StreamBuilder(
          initialData: true,
          stream: bloc.loading.stream,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            return Visibility(
              child: Loading(),
              visible: snapshot.data!,
            );
          },
        )
      ],
    ));
  }
}
