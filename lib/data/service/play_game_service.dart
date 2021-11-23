import 'dart:convert';
import 'package:game_mini/data/service/api/api.dart';
import 'package:http/http.dart' as Http;

typedef OnResultData<T> = Function(T);

abstract class GetPlayGameService {
  Future<void> getPlayGame({required OnResultData onResultData,});
}
class GetPlayGameImpl implements GetPlayGameService {
  @override
  Future<void> getPlayGame(
      { required OnResultData onResultData }) async {
    Uri uri = Uri.parse(Api.baseUrl + "/Question/getListVocabulary");
    Http.Response? response =
    await Http.get(uri).then((value) {
      int status = value.statusCode;
      if (status == 200) {
        return value;
      }
    });
    if (response != null) {
      Map<String, dynamic> data =
      jsonDecode(utf8.decode(response.bodyBytes));
      print("data $data");
      onResultData(data['listVocabulary']);
    }
  }
}

