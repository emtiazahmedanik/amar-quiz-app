import 'package:hive_ce/hive.dart';

class JavascriptTrack{
  static late Box _box;
  static Future<void> _initializeHive() async{
    if(!Hive.isBoxOpen("javascriptTrack")){
      _box = await Hive.openBox('javascriptTrack');
    }else{
      _box = Hive.box('javascriptTrack');
    }
  }
  static void insertAnswered(int data) async{
    await _initializeHive();
    _box.put('221', data);
  }
  static int getAnsweredValue() {
     _initializeHive();
    return _box.get('221')??0;
  }
  static void insertTotalQuestion(int data) async{
    await _initializeHive();
    _box.put('22100', data);
  }
  static int getTotalQuestionValue() {
    _initializeHive();
    return _box.get('22100')??0;
  }
}