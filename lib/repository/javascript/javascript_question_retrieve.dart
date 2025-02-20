import 'package:amar_quiz_app/model/question_model.dart';
import 'package:hive_ce/hive.dart';


class JavascriptQuestionRetrieve{
  static late Box<QuestionModel> _box;
  static List<QuestionModel> questions = [];
  static Future<void> _hiveInitialize()async {
    if(!Hive.isBoxOpen('javascriptQuestion')){
      _box = await Hive.openBox<QuestionModel>('javascriptQuestion');
    }else{
      _box = Hive.box<QuestionModel>("javascriptQuestion");
    }
  }
  static List<QuestionModel> retrieveQuestion() {
    _hiveInitialize();
    questions = _box.values.toList();
    return questions;
  }
}