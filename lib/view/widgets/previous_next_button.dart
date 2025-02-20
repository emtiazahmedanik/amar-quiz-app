import 'package:flutter/material.dart';

class PreviousNextButton extends StatelessWidget {
  final String text;
  const PreviousNextButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(35, 76, 157, 1.0)
      ),
      child: Center(child: Text(text,style:Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 13),)),
    );
  }
}
