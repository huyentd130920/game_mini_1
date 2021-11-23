import 'package:game_mini/bloc/core_stream.dart';
import 'package:game_mini/data/service/list_question_service.dart';
import 'package:game_mini/models/question_list_model.dart';

class ListQuestionBloc {
  List<QuestionListModel> list = [];
  late CoreStream<List<QuestionListModel>> listQuestion = CoreStream();

  void getQuestion() async {
    ListQuestionServiceImpl service = ListQuestionServiceImpl();
    service.getListQuestion(onResultData: (resultData) async {
      List<QuestionListModel>? listUSer = [];
      Iterable i = resultData;
      print(i);
      if (i.isNotEmpty) {
        listUSer = i.map((model) => QuestionListModel.fromJson(model))
            .cast<QuestionListModel>().toList();
        list.addAll(listUSer);
        listQuestion.notify(list);
      }
    });
  }
}
