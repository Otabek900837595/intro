import 'package:flutter/material.dart';
import 'package:intro/pages/home_page.dart';

import '../utilis/strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  // int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                // currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                reverse: true,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            //  skip
              Visibility(
                // visible: (currentIndex == 2) ? true : false,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Skip",style: TextStyle( color: Colors.green,fontSize: 18,fontWeight: FontWeight.w400
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            //  indikator
              Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // children: _buildIndicator(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget makePage({image, title, content,reverse = false}){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
          const SizedBox(height: 10,),
          Text(title,style: const TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold,)),
          const SizedBox(height: 30,),
          Text(content , textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400,),),
        ],
      ),
    );
  }


  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  // List<Widget> _buildIndicator(){
  //   List<Widget> indicator = [];
  //   for(int i = 0; i < 3; i++){
  //     if(currentIndex == i){
  //       indicator.add(_indicator(true));
  //     }else{
  //       indicator.add(_indicator(false));
  //     }
  //   }
  //   return indicator;
  // }
}
