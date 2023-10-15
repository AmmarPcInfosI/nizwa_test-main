import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/profile_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.02,
          right: MediaQuery.sizeOf(context).width * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              trailing: const Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF89875B),
              ),
              title: Text(
                'الملف الشخصي',
                textAlign: TextAlign.end,
                style: GoogleFonts.notoSansArabic(
                  color: const Color(0xFF89875B),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 137, 135, 91),
            ),
            ListTile(
              trailing: const Icon(
                Icons.book,
                color: Color(0xFF89875B),
              ),
              title: Text(
                'الحجوزات',
                textAlign: TextAlign.end,
                style: GoogleFonts.notoSansArabic(
                  color: const Color(0xFF89875B),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 137, 135, 91),
            ),
            ListTile(
              trailing: const Icon(
                Icons.newspaper,
                color: Color(0xFF89875B),
              ),
              title: Text(
                'الاخبار',
                textAlign: TextAlign.end,
                style: GoogleFonts.notoSansArabic(
                  color: const Color(0xFF89875B),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 137, 135, 91),
            ),
            ListTile(
              trailing: const Icon(
                Icons.settings,
                color: Color(0xFF89875B),
              ),
              title: Text(
                'الاعدادات',
                textAlign: TextAlign.end,
                style: GoogleFonts.notoSansArabic(
                  color: const Color(0xFF89875B),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 137, 135, 91),
            ),
            ListTile(
              trailing: const Icon(
                Icons.support_agent,
                color: Color(0xFF89875B),
              ),
              title: Text(
                'تواصل معنا',
                textAlign: TextAlign.end,
                style: GoogleFonts.notoSansArabic(
                  color: const Color(0xFF89875B),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 137, 135, 91),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 79 / 844,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 230 / 390,
                ),
                InkWell(onTap: () {
                  
                },
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.arrow_back_sharp,
                              color: Color(0xFF89875B))),
                      Text(
                        'تسجيل خروج',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.notoNaskhArabic(
                          color: const Color(0xFF89875B),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
