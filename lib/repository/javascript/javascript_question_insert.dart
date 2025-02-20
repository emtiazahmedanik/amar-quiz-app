import 'package:amar_quiz_app/model/question_model.dart';
import 'package:hive_ce/hive.dart';
class JavascriptQuestionInsert{
  static late final Box<QuestionModel> _box;
  static Future<void> _hiveInitialize()async {
    if(!Hive.isBoxOpen('javascriptQuestion')){
      _box = await Hive.openBox<QuestionModel>('javascriptQuestion');
    }else{
      _box = Hive.box<QuestionModel>("javascriptQuestion");
    }
  }

  static Future<void> storeQuestions() async {
    await _hiveInitialize();

    // Check if the box is empty
    if (_box.isEmpty) {
      // Add the questions only if the box is empty
      List<QuestionModel> questions = [
        QuestionModel(
          question: "What is JavaScript primarily used for?",
          options: [
            "Styling web pages",
            "Structuring web pages",
            "Making web pages interactive",
            "Managing databases"
          ],
          correctAnswerIndex: 2,
        ),
        QuestionModel(
          question: "Which keyword is used to declare a variable in JavaScript?",
          options: ["var", "let", "const", "All of the above"],
          correctAnswerIndex: 3,
        ),
        QuestionModel(
          question: "What is the output of typeof null?",
          options: ["object", "null", "undefined", "number"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which of the following is not a JavaScript data type?",
          options: ["String", "Boolean", "Float", "Number"],
          correctAnswerIndex: 2,
        ),
        QuestionModel(
          question: "How do you write 'Hello World' in an alert box?",
          options: [
            "msg('Hello World');",
            "alert('Hello World');",
            "msgBox('Hello World');",
            "console.log('Hello World');"
          ],
          correctAnswerIndex: 1,
        ),
        QuestionModel(
          question: "Which symbol is used for single-line comments in JavaScript?",
          options: ["//", "/* */", "--", "#"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "What will the following return: Boolean('false')?",
          options: ["true", "false", "null", "undefined"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which function is used to parse a string to an integer?",
          options: ["parseInt()", "parseFloat()", "Number()", "toInteger()"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "What does the '===' operator do in JavaScript?",
          options: [
            "Checks value only",
            "Checks value and type",
            "Assigns a value",
            "Compares three values"
          ],
          correctAnswerIndex: 1,
        ),
        QuestionModel(
          question: "How do you define a function in JavaScript?",
          options: [
            "function myFunction() {}",
            "def myFunction() {}",
            "fn myFunction() {}",
            "define myFunction() {}"
          ],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which JavaScript method is used to access an HTML element by ID?",
          options: [
            "getElementById()",
            "querySelector()",
            "getElement()",
            "getId()"
          ],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which JavaScript loop executes at least once before checking the condition?",
          options: ["for", "while", "do...while", "foreach"],
          correctAnswerIndex: 2,
        ),
        QuestionModel(
          question: "What is an array in JavaScript?",
          options: [
            "A single variable that can hold multiple values",
            "A function",
            "A data type",
            "An object only"
          ],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which method adds a new element to the end of an array?",
          options: ["push()", "pop()", "shift()", "unshift()"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "What will '5' + 3 evaluate to?",
          options: ["8", "53", "error", "undefined"],
          correctAnswerIndex: 1,
        ),
        QuestionModel(
          question: "How do you check if a variable is an array?",
          options: ["typeof", "isArray()", "instanceof", "Both B and C"],
          correctAnswerIndex: 3,
        ),
        QuestionModel(
          question: "What does the 'this' keyword refer to in JavaScript?",
          options: [
            "The current function",
            "The global object",
            "The object that owns the function",
            "None of the above"
          ],
          correctAnswerIndex: 2,
        ),
        QuestionModel(
          question: "Which of the following is a JavaScript framework?",
          options: ["React", "Laravel", "Django", "Bootstrap"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "What does JSON stand for?",
          options: [
            "JavaScript Object Notation",
            "Java Standard Object Notation",
            "Java Serialized Object Notation",
            "None of the above"
          ],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which function converts a JavaScript object to a JSON string?",
          options: ["JSON.stringify()", "JSON.parse()", "toJSON()", "stringifyJSON()"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which event occurs when a user clicks on an HTML element?",
          options: ["onmouseover", "onchange", "onclick", "onpress"],
          correctAnswerIndex: 2,
        ),
        QuestionModel(
          question: "How do you declare an asynchronous function in JavaScript?",
          options: ["async function()", "function async()", "await function()", "function() async"],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: "Which method is used to make an HTTP request in JavaScript?",
          options: ["fetch()", "httpRequest()", "ajax()", "getRequest()"],
          correctAnswerIndex: 0,
        )
      ];


      // Add questions to the database
      for (var question in questions) {
        await _box.add(question);
      }
    }
  }

}