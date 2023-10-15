import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/notifications.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedIndex = -1;
  List<String> events = [
    'ثقافي',
    'ترفيهي',
    'تراثي',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.sizeOf(context).width,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 137, 135, 91),
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite,
                    size: 30, color: Color.fromARGB(255, 137, 135, 91)))
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 13 / 390),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'احجز',
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 64,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                  Text(
                    'اهم الفعاليات في نزوى',
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 26 / 390,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 340 / 390,
              height: MediaQuery.sizeOf(context).height * 46 / 844,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SearchBar(
                  onTap: () {},
                  leading: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 137, 135, 91)),
                  hintText: 'ابحث عن الفعاليات',
                  hintStyle:
                      MaterialStateProperty.all(GoogleFonts.notoSansArabic(
                    color: Colors.white.withOpacity(0.4000000059604645),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  )),
                  textStyle:
                      MaterialStateProperty.all(GoogleFonts.notoSansArabic(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  )),
                  constraints:
                      const BoxConstraints(maxHeight: 46, maxWidth: 340),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 243 / 390,
              alignment: Alignment.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.06);
                },
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = index == selectedIndex;

                  return Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(events[index],
                          textAlign: TextAlign.center,
                          style: isSelected
                              ? GoogleFonts.notoSansArabic(
                                  color: const Color(0xFF060606),
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor: Color(0xFF89875B),
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 1)
                              : GoogleFonts.notoSansArabic(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF060606),
                                  height: 1)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
