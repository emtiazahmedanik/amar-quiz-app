import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  final String imagePath;
  final String text;
  const Categories({super.key, required this.imagePath,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:56,
      width: 56,
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

              decoration: BoxDecoration(
                  color: Color.fromRGBO(171, 194, 227, 0.73),
                  borderRadius: BorderRadius.circular(5)
              ),
              height:34,
              width: 56,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(imagePath,fit: BoxFit.contain,),
              )
          ),
          Text(text,style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
    );
  }

}
