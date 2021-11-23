
import 'package:flutter/material.dart';
import 'package:game_mini/bloc/core_stream.dart';
import 'package:game_mini/data/service/play_game_service.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:game_mini/models/reponse_list_model.dart';

class PlayGameBloc {
  List<PlayGameModel> list = [];
  late CoreStream<List<PlayGameModel>> listQuestion = CoreStream();
  late CoreStream<bool> loading = CoreStream();

  void dispose(){
    listQuestion.closeStream();
    loading.closeStream();
  }

  // void getPlayGame() async {
  //   loading.notify(true);
  //   GetPlayGameImpl service = GetPlayGameImpl();
  //   service.getPlayGame(onResultData: (resultData) async {
  //     List<PlayGameModel>? listUSer = [];
  //     Iterable i = resultData;
  //     print(i);
  //     if (i.isNotEmpty) {
  //       listUSer = i.map((model) => PlayGameModel.fromJson(model))
  //           .toList();
  //       list.addAll(listUSer);
  //       listQuestion.notify(list);
  //     }
  //   });
  //   loading.notify(false);
  // }

  void getPlayGame1() async {
    loading.notify(true);
    GetPlayGameImpl service = GetPlayGameImpl();
    service.getPlayGame(onResultData: (resultData) async {
      Iterable i = resultData;
      print(i);
      if (i.isNotEmpty) {
        list = i.map((model) => PlayGameModel.fromJson(model))
            .toList();
        print(list);
        // userList?.data?.addAll(listGame);
        listQuestion.notify(list);
      }
      loading.notify(false);
    });

  }
}