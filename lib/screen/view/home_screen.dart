import 'dart:math';

import 'package:flutter/material.dart';
List image = [
  'assets/image/earth.png',
  'assets/image/marcury.png',
  'assets/image/mars.png',
  'assets/image/moon.png',
  'assets/image/neptune.png',
];

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? mar;
  Animation? aligenTween;


  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    mar = AnimationController(vsync: this, duration: Duration(seconds: 2));

    aligenTween = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.topLeft),
          weight: 1),
    ]).animate(animationController!);

    aligenTween = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
    ]).animate(mar!);
    animationController!.repeat(reverse: true);
    mar!.repeat(reverse: true);
    animationController!.addListener(() {
      setState(() {});
    });
    mar!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Treva"),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search_rounded),
          ],
        ),
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Stack(
        //         children: [
        //           Container(
        //             height: 100,
        //             width: double.infinity,
        //             color: Colors.amber,
        //           ),
        //           AnimatedBuilder(
        //             animation: animationController!,
        //             builder: (context, child) {
        //               return Transform.rotate(
        //                 angle: animationController!.value * pi * 2,
        //                 child: child,
        //               );
        //             },
        //             child: CircleAvatar(
        //               radius: 50,
        //               backgroundImage: AssetImage("assets/image/earth.png"),
        //             ),
        //           ),
        //
        //         ],
        //       ),
        //     ),
        //
        //     AnimatedBuilder(
        //       animation: mar!,
        //       builder: (context, child) {
        //         return Transform.rotate(
        //           angle: mar!.value * pi * 2,
        //           child: child,
        //         );
        //       },
        //       child: CircleAvatar(
        //         radius: 50,
        //         backgroundImage: AssetImage("assets/image/mars.png"),
        //       ),
        //     ),
        //   ],
        // ),


        body:SingleChildScrollView(
          child: Column(
              children: [
                tile('assets/image/earth.png','Earth',0),
                tile('assets/image/marcury.png','Marcury',1),
                tile('assets/image/mars.png','Mars',2),
                tile('assets/image/moon.png','Moon',3),
                tile('assets/image/neptune.png','Neptune',4),
              ],
            ),
        )
      ),
    );
  }

  Widget tile(String? img,String? name,int? index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'vi',arguments: image[index!]);
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Color(0xff8d6464),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("$name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Milkyway Glaxey",style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10,),
                        SizedBox(width: 50,child: LinearProgressIndicator(value: 0.25,))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animationController!.value * pi * 2,
                    child: child,
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("$img"),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
