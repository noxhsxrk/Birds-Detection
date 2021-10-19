import 'package:birds_detection/screens/main_screen.dart';
import 'package:birds_detection/widgets/preferences.dart';

import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'สวัสดี',
            body: 'นี่เป็นแอพพลิเคชันประกอบการเรียนรู้การจำแนกประเภทของนก',
            image: Center(
              child: Image.asset(
                'assets/bird_intro.jpg',
                width: 500,
              ),
              heightFactor: 100,
            ),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'การใช้งาน แอพพลิเคชัน',
            body: 'เลือกที่รูปนกเพื่อดูข้อมุลของนกตัวนั้นๆ',
            image: Center(
              child: Image.asset(
                'assets/tutor/tutor_01.jpg',
                scale: 1,
                width: 500,
              ),
              heightFactor: 100,
            ),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '',
            body:
                'ที่หน้ากล้อง ให้กดที่กรอบที่ตีรอบนกที่ต้องการเพื่อดูข้อมูลของนกตัวนั้น',
            image: Center(
              child: Image.asset(
                'assets/tutor/tutor_02.jpg',
                scale: 1,
                width: 500,
              ),
              heightFactor: 100,
            ),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'เสร็จสิ้น',
            body: 'แค่นี้ก็สามารถดูข้อมูลของนกได้แล้ว!',
            image: Center(
              child: Image.asset(
                'assets/tutor/tutor_03.jpg',
                scale: 1,
                width: 500,
              ),
              heightFactor: 100,
            ),
            footer: ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
                await UserPreferences.setIntroPageStat("false");
              },
              child: Text(
                'เริ่มต้นใช้งานแอพพลิเคชัน',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            decoration: getPageDecoration()),
      ],
      skip: Text(
        'ข้าม',
        style: TextStyle(color: Colors.black),
      ),
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      onSkip: () => goHome(context),
      next: Icon(Icons.arrow_forward_ios),
      done: Text(''),
      onDone: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
        await UserPreferences.setIntroPageStat("false");
      },
      dotsDecorator: getDotsDecoration(),
    );
  }
}

PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 20),
    //descriptionPadding: EdgeInsets.symmetric(vertical: 2),
    imagePadding: EdgeInsets.only(top: 100));

void goHome(context) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => MainScreen()));

DotsDecorator getDotsDecoration() => DotsDecorator(
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
