import 'package:amar_quiz_app/model/question_model.dart';
import 'package:hive_ce/hive.dart';


class HtmlQuestionRetrieve{
  static late Box<QuestionModel> _box;
  static List<QuestionModel> questions = [];
  static Future<void> _hiveInitialize()async {
    if(!Hive.isBoxOpen('htmlQuestion')){
      _box = await Hive.openBox<QuestionModel>('htmlQuestion');
    }else{
      _box = Hive.box<QuestionModel>("htmlQuestion");
    }
  }
  static List<QuestionModel> retrieveQuestion() {
    _hiveInitialize();
    questions = _box.values.toList();
    return questions;
  }
}