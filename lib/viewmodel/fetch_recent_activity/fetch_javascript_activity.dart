import 'package:amar_quiz_app/repository/javascript/javascript_track.dart';

import '../../repository/html/html_track.dart';

class FetchJavascriptActivity{
  static int totalQuestion = 0;
  static int answeredQuestion =  0;
  static fetchJavascriptactivity(){
    totalQuestion = JavascriptTrack.getTotalQuestionValue() ;
    answeredQuestion = JavascriptTrack.getAnsweredValue() ;
  }
}