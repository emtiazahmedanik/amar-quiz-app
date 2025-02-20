import '../../repository/html/html_track.dart';

class FetchHtmlActivity{
  static int totalQuestion = 0;
  static int answeredQuestion =  0;
  static fetchhtmlactivity(){
    totalQuestion = HtmlTrack.getTotalQuestionValue() ;
    answeredQuestion = HtmlTrack.getAnsweredValue() ;
  }
}