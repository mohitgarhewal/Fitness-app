import 'package:flutter/material.dart';
import 'package:fitness/commmon/colour_extension.dart';
import 'package:fitness/common_widget/on_boarding_page.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() =>  _OnBoardingViewState();
}

class  _OnBoardingViewState extends State<OnBoardingView> {
  int selectpage = 0;
 PageController controller = PageController();

 @override
 void initState(){
  super.initState();
  controller.addListener(() {
    selectpage = controller.page?.round() ?? 0;

    setState(() {
      
    });
  });

 }

 // ignore: override_on_non_overriding_member
 List pageArr = [
   {
     "title":"Track Your Goal",
     "subtitle":"Don't Worry if you have trouble determining your goals, We can help you determine your goals",
     "image":"assets/img/on_1.png",
   },
   {
     "title":"Get Burn",
     "subtitle":" Let's keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
     "image":"assets/img/on_2.png",
   },
   {
     "title":"Eat Well",
     "subtitle":" Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun. ",
     "image":"assets/img/on_3.png",
   },
   {
     "title":"Improve Sleep Quality",
     "subtitle":"Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
     "image":"assets/img/on_4.png",
   },
 ];
 
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment:  Alignment.bottomRight,
        children: [
            PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index )
              {
                var pObj = pageArr[index] as Map? ?? {};
                return OnboardingPage(pObj: pObj) ;
            }),
          
          SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
               SizedBox(
                  width: 70,
                  height: 70,
                  child:  CircularProgressIndicator(
                     color: TColor.primaryColor1,
                     value:selectpage/4,
                     strokeWidth: 2,

                  ),
               ),
               Container(

                 margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                 width: 60,
                 height: 60,
                 decoration: BoxDecoration(color: TColor.primaryColor1,borderRadius: BorderRadius.circular(35)),
                 child:  IconButton(icon: Icon(Icons.navigate_next, color: TColor.white,),onPressed: (){
                  
                  if(selectpage<3)
                  {
                    selectpage=selectpage+1;

                    controller.jumpToPage(selectpage);
                    setState(() {
                      
                    });
                  }else{
                    print("Open Welcome Screen"); // This Open welcome screen.
                  }
                 },),
               )

              ],)
          )

        ]
      )
    );
  }
}