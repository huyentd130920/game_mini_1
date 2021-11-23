class PlayGameModel {
  String? nId;
  String? id;
  String? noun;
  String? nounMeaning;
  String? nounCateId;
  String? adjId;
  String? adjective;
  String? adjMeaning;
  String? adjCateId;

  PlayGameModel(
      {this.nId,
        this.id,
        this.noun,
        this.nounMeaning,
        this.nounCateId,
        this.adjId,
        this.adjective,
        this.adjMeaning,
        this.adjCateId});

  PlayGameModel.fromJson(Map<String, dynamic> json) {
    nId = json['nId'];
    id = json['id'];
    noun = json['noun'];
    nounMeaning = json['noun_meaning'];
    nounCateId = json['noun_cateId'];
    adjId = json['adjId'];
    adjective = json['adjective'];
    adjMeaning = json['adj_meaning'];
    adjCateId = json['adj_cateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nId'] = this.nId;
    data['id'] = this.id;
    data['noun'] = this.noun;
    data['noun_meaning'] = this.nounMeaning;
    data['noun_cateId'] = this.nounCateId;
    data['adjId'] = this.adjId;
    data['adjective'] = this.adjective;
    data['adj_meaning'] = this.adjMeaning;
    data['adj_cateId'] = this.adjCateId;
    return data;
  }
}



// class PlayGameModel {
//   int? id;
//   String? question;
//   String? answerOne;
//   String? answerTwo;
//   String? trueAnswer;
//   int? cateId;
//   int? nounId;
//   int? adjId;
//
//   PlayGameModel(
//       {this.id,
//         this.question,
//         this.answerOne,
//         this.answerTwo,
//         this.trueAnswer,
//         this.cateId,
//         this.nounId,
//         this.adjId});
//
//   PlayGameModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     question = json['Question'];
//     answerOne = json['answer_one'];
//     answerTwo = json['answer_two'];
//     trueAnswer = json['true_answer'];
//     cateId = json['cate_id'];
//     nounId = json['noun_id'];
//     adjId = json['adj_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['Question'] = this.question;
//     data['answer_one'] = this.answerOne;
//     data['answer_two'] = this.answerTwo;
//     data['true_answer'] = this.trueAnswer;
//     data['cate_id'] = this.cateId;
//     data['noun_id'] = this.nounId;
//     data['adj_id'] = this.adjId;
//     return data;
//   }
// }