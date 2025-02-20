import 'package:amar_quiz_app/repository/html/html_track.dart';
import 'package:amar_quiz_app/repository/javascript/javascript_track.dart';
import 'package:amar_quiz_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/previous_next_button.dart';

class ScoreScreen extends StatelessWidget {
  final int totalCorrectAns;
  final int totalQuestion;
  final String topic;
  const ScoreScreen({super.key, required this.totalCorrectAns,required this.totalQuestion,required this.topic});

  String greetingText(){
    if(totalCorrectAns == 0){
      return "Don't Loss Hope! Try Again";
    }else if(totalCorrectAns>0 && totalCorrectAns<=5){
      return "Good Try! Keep Practicing";
    }else if(totalCorrectAns>5 && totalCorrectAns<=15){
      return "Very Good Score! You Did It";
    }else{
      return "Great job, Emtiaz Ahmed! You Did It";
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(height: 30,),
                SizedBox(
                  width: 187,
                  height: 187,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(187, 187), // Set size of the canvas
                        painter: CirclePainter(radius: 80, color: Color.fromRGBO(64, 125, 216, 1)),
                      ),
                      CustomPaint(
                        size: const Size(168, 168), // Set size of the canvas
                        painter: CirclePainter(radius: 70, color: Color.fromRGBO(15, 70, 154, 1)),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Prevents Column from taking full height
                            children: [
                              Text(
                                "Your Score",
                                style: GoogleFonts.kufam(
                                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                                ),
                              ),
                              Text(
                                "$totalCorrectAns/$totalQuestion",
                                style: GoogleFonts.kufam(
                                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )

                ),
                Text("Congratulation",style: GoogleFonts.kufam(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color.fromRGBO(15, 70, 154, 1))),),
                Text(greetingText(),style: GoogleFonts.kufam(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(15, 70, 154, 1))),),
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(width:double.infinity,child: PreviousNextButton(text: "Share")),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(width:double.infinity,
                      child: InkWell(
                        onTap: () {
                          if(topic=="HTML"){
                            HtmlTrack.insertAnswered(totalCorrectAns);
                            HtmlTrack.insertTotalQuestion(totalQuestion);
                          }else if(topic == "JavaScript"){
                            JavascriptTrack.insertAnswered(totalCorrectAns);
                            JavascriptTrack.insertTotalQuestion(totalQuestion);
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                                (Route<dynamic> route) => false, // Removes all previous routes
                          );
                        },
                      child: PreviousNextButton(text: "Back To Home"))),
                )


              ],
            ),
          )
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double radius;
  final Color color;

  CirclePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill; // Use .stroke for an outlined circle

    // Draw the circle at the center of the available space
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.radius != radius || oldDelegate.color != color;
  }
}
