import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/second_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/bg.jpeg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 110 / 844),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'اكتشف',
                  style: GoogleFonts.notoSansArabic(
                    color: const Color(0xFF89875B),
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                Text(
                  'افضل الاماكن في نزوى',
                  style: GoogleFonts.notoSansArabic(
                    color: const Color(0xFF89875B),
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 522 / 844,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
            child: SwipeableButtonView(
              buttonText: 'ابدأ',
              buttonWidget: Container(
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
              ),
              activeColor: const Color(0xFF89875B),
              isFinished: isFinished,
              onWaitingProcess: () {
                Future.delayed(const Duration(microseconds: 20), () {
                  setState(() {
                    isFinished = true;
                  });
                });
              },
              onFinish: () async {
                await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: const SecondScreen()));

                //TODO: For reverse ripple effect animation
                setState(() {
                  isFinished = false;
                });
              },
            ),
          )
        ],
      ),
    ));
  }
}
