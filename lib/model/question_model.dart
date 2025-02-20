import 'package:hive_ce/hive.dart';

part 'question_model.g.dart'; // This must match the generated file name

@HiveType(typeId: 0)
class QuestionModel{
  @HiveField(0)
  final String question;

  @HiveField(1)
  final List<String> options;

  @HiveField(2)
  final int correctAnswerIndex;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

}