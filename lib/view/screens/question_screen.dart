import 'package:amar_quiz_app/model/question_model.dart';
import 'package:amar_quiz_app/repository/html/html_question_retrive.dart';
import 'package:amar_quiz_app/repository/javascript/javascript_question_retrieve.dart';
import 'package:amar_quiz_app/view/screens/score_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/previous_next_button.dart';

class QuestionScreen extends StatefulWidget {
  final String topic;

  QuestionScreen({super.key,required this.topic});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;

  List<QuestionModel> questions = [];

  QuestionModel? question;

  bool isCorrectIcon = false;

  bool isWrongIcon = false;

  int currentSelectedIndex = -1;
  int correctAnsIndex = -1;
  int totalCorrectAnswer = 0;
  int totalQuestions = 0;
  bool vanishSubmitButton = false;

  void _nextQuestion(){
    setState(() {
      if(index<totalQuestions-1) {
        index++;
        question = questions[index];
        correctAnsIndex = question!.correctAnswerIndex;
        currentSelectedIndex=-1;
        isWrongIcon = false;
        isCorrectIcon = false;
        vanishSubmitButton = false;

      }
    });
  }
  void _prevQuestion(){
    setState(() {
      if(index>=1) {
        index--;
        question = questions[index];
        currentSelectedIndex=-1;
        correctAnsIndex = question!.correctAnswerIndex;
        isWrongIcon = false;
        isCorrectIcon = false;
        vanishSubmitButton = false;

      }
    });
  }
  void verifyAnswer(){
    if(currentSelectedIndex==correctAnsIndex){
      setState(() {
        isCorrectIcon = true;
        isWrongIcon = false;
        totalCorrectAnswer++;
        vanishSubmitButton = true;
      });
    }else{
      setState(() {
        isCorrectIcon = false;
        isWrongIcon = true;
      });
    }
  }
  void selectedAnswer(int index){
    setState(() {
      currentSelectedIndex  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.topic == "HTML" && questions.isEmpty) {
      questions = HtmlQuestionRetrieve.retrieveQuestion();
    }else if (widget.topic == "JavaScript" && questions.isEmpty) {
      questions = JavascriptQuestionRetrieve.retrieveQuestion();
    }
    question = questions[index];
    correctAnsIndex = question!.correctAnswerIndex;
    totalQuestions = questions.length;


    if (questions.isEmpty || question == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Loading...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.topic,style: Theme.of(context).textTheme.headlineLarge),
            Text("$totalQuestions Question",style:Theme.of(context).textTheme.headlineMedium)
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.navigate_next)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 3,
                        blurRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Question:  ${index+1}/$totalQuestions',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color.fromRGBO(15, 70, 154, 1))),
                          SizedBox(
                            width: 50,
                            child: Row(
                              children: [
                                Visibility(visible: isCorrectIcon,child: Icon(Icons.task_alt,color: Colors.green,)),
                                Visibility(visible: isWrongIcon,child: Icon(Icons.cancel_outlined,color: Colors.red,))
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child:  Text('Quit',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color.fromRGBO(160, 37, 37, 1)))
                          )
                        ],
                      ),
                      Text(question!.question,style: Theme.of(context).textTheme.headlineLarge,),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(itemBuilder: (context,index)=>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(

                                child: Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: currentSelectedIndex == index
                                          ? (isCorrectIcon ? Colors.green : (isWrongIcon ? Colors.red : Color.fromRGBO(64, 93, 206, 1)))
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 3,
                                            blurRadius: 10
                                        )
                                      ]
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 7),
                                        child: Text(
                                            question!.options[index],
                                          style:currentSelectedIndex==index?Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white) :Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      )),
                                ),
                                onTap: (){
                                  selectedAnswer(index);
                                },
                              ),
                            ),
                          itemCount: question!.options.length,

                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints:BoxConstraints(maxWidth: 140),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent
                              ),
                              child: ExpansionTile(
                                title: Row(
                                  children: [
                                    Text("See Result",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.deepPurple,fontSize: 12),),
                                    Icon(Icons.arrow_drop_down_outlined)
                                  ],
                                ),

                                iconColor: Colors.deepPurple,
                                tilePadding: EdgeInsets.symmetric(horizontal: 0),
                                childrenPadding: EdgeInsets.symmetric(horizontal: 0),
                                trailing: SizedBox(height: 10,),
                                initiallyExpanded: false,
                                shape: RoundedRectangleBorder(),
                                children: [
                                  Align(
                                      alignment:Alignment.centerLeft,
                                      child: Text("${question!.options[correctAnsIndex]}",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          vanishSubmitButton==true?SizedBox.shrink():TextButton(
                              onPressed: (){
                                verifyAnswer();
                              },
                              child: Text("Submit",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.blue,fontSize: 12),)
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),

            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: PreviousNextButton(text: "Previous",),
                    onTap: (){
                      _prevQuestion();
                    },
                  ),
                  InkWell(
                    child: PreviousNextButton(text: "Next",),
                    onTap: (){
                      if(index==totalQuestions-1){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context)=>ScoreScreen(totalCorrectAns: totalCorrectAnswer,totalQuestion: totalQuestions,topic: widget.topic,))
                        );
                      }
                      _nextQuestion();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
