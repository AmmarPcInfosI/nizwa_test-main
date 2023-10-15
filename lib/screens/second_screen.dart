import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/authintication/login_screen.dart';
import 'package:nizwa_test/screens/main_screen.dart';
import 'package:nizwa_test/screens/authintication/register_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                top: MediaQuery.sizeOf(context).height * 113 / 844),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'اكتشف',
                  style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      height: 1),
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
            height: MediaQuery.sizeOf(context).height * 46 / 844,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xB289875B), // Set the background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              minimumSize: Size(
                MediaQuery.of(context).size.width * 209 / 390,
                MediaQuery.of(context).size.height * 71 / 844,
              ),
            ),
            child: Text(
              'تسجيل الدخول',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansArabic(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 24 / 844,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xB289875B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              minimumSize: Size(
                MediaQuery.of(context).size.width * 209 / 390,
                MediaQuery.of(context).size.height * 71 / 844,
              ),
            ),
            child: Text(
              'انشاء حساب',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansArabic(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 326 / 844),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                child: Text(
                  'الدخول كزائر',
                  style: GoogleFonts.notoSansArabic(
                    shadows: [
                      const Shadow(color: Colors.white, offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xB289875B),
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
