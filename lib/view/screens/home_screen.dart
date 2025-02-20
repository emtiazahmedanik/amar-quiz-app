import 'dart:ui';

import 'package:amar_quiz_app/repository/html/html_track.dart';
import 'package:amar_quiz_app/repository/javascript/javascript_track.dart';
import 'package:amar_quiz_app/view/screens/question_screen.dart';
import 'package:amar_quiz_app/view/widgets/recent_activities.dart';
import 'package:amar_quiz_app/viewmodel/fetch_recent_activity/fetch_html_activity.dart';
import 'package:amar_quiz_app/viewmodel/fetch_recent_activity/fetch_javascript_activity.dart';
import 'package:flutter/material.dart';

import '../widgets/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchHtmlActivity.fetchhtmlactivity();
    FetchJavascriptActivity.fetchJavascriptactivity();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              child: const Icon(Icons.person),
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emtiaz Ahmed',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'ID-1045',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ElevatedButton.icon(
              onPressed: (){},
              label: Text('150',style: Theme.of(context).textTheme.headlineLarge,),
              icon: Icon(Icons.diamond_outlined,color: Colors.black,),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade100,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
            ),
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionScreen(topic: "")));
              },
              icon: Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                SizedBox(height: 1,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      // Background Image with Blur
                      Container(
                        width: double.infinity,
                        height: 129,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/trophy bg.png"), // Your image path
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5), // Blur effect
                            child: Container(
                              color: Colors.black.withAlpha(0), // Optional dark overlay
                            ),
                          ),
                        ),
                      ),

                      // Foreground Content
                      Positioned.fill(
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Test you knowledge with quiz's",
                                style: Theme.of(context).textTheme.labelLarge
                            ),
                            const SizedBox(height: 15),
                            Text("You're just looking for a playful way to learn new facts, our quizzes are designed to entertain and educate.",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(height: 5,),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Button action
                              },
                              label: Text('Play Now',style: Theme.of(context).textTheme.labelMedium,),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),//Background Image with blur
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth*0.8,
                        height: 40,
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              filled: true,
                              fillColor: Color.fromRGBO(122, 131, 128, 0.2),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent,width: 0)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent,width: 0)
                              ),
                              suffixIcon: Icon(Icons.search_rounded),
                              hintText: 'Search',
                              hintStyle: Theme.of(context).textTheme.headlineMedium
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(122, 131, 128, 0.2)
                        ),
                        child: Icon(Icons.filter_list),
                      )

                    ],
                  ),
                ),//Search Bar and Filter
                Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Categories',style: Theme.of(context).textTheme.headlineLarge,),
                ),//Category text
                Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 12,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>QuestionScreen(topic: 'HTML',)));
                          },
                          child: Categories(imagePath: "assets/images/html_1051277.png", text: "HTML"),
                        ),
                        InkWell(
                          child: Categories(imagePath: "assets/images/java-script_1199124.png", text: "JavaScript"),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>QuestionScreen(topic: 'JavaScript',)));
                          },
                        ),
                        Categories(imagePath: "assets/images/atom_4969244.png", text: "React"),
                        Categories(imagePath: "assets/images/flutter.png", text: "Flutter"),
                        Categories(imagePath: "assets/images/python_5968350.png", text: "Python"),
                      ],
                    ),
                  ),
                ),//Category buttons
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Recent Activity',style: Theme.of(context).textTheme.headlineLarge,),
                ),//Recent Activity text
                Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:Column(
                      spacing: 6,
                      children: [
                        FetchHtmlActivity.answeredQuestion==0
                            ? SizedBox.shrink()
                            : RecentActivities(
                          imagePath: 'assets/images/html_1051277.png',
                          topic: "HTML",
                          totalQuestion: FetchHtmlActivity.totalQuestion,
                          answeredQuestion: FetchHtmlActivity.answeredQuestion,
                          fillColor: Color.fromRGBO(253, 228, 228, 1),
                          valueColor: Color.fromRGBO(248, 41, 41, 1),
                        ),//Html recent activity
                        FetchJavascriptActivity.answeredQuestion==0
                            ? SizedBox.shrink()
                            : RecentActivities(
                          imagePath: 'assets/images/java-script_1199124.png',
                          topic: "JavaScript",
                          totalQuestion: FetchJavascriptActivity.totalQuestion,
                          answeredQuestion: FetchJavascriptActivity.answeredQuestion,
                          fillColor: Color.fromRGBO(253, 243, 228, 1.0),
                          valueColor: Color.fromRGBO(157, 155, 49, 1.0),)
                      ],
                    )
                    ),
                  ),
                //Recent Activity Contents

              ],
            ),
          )
      ),
    );
  }
}
