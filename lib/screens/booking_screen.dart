
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/models/all_places.dart';
import 'package:nizwa_test/screens/notifications.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedIndex = 2;
  
  List<String> events = [
    'تراثي',
    'ترفيهي',
    'ثقافي',
  ];
  List<List<PlacesModel>> eventLists = [
    [
      PlacesModel(Name: 'التراثي الأول', Media: 'lib/assets/bg.jpeg'),
      PlacesModel(Name: 'التراثي الثاني', Media: 'lib/assets/bg.jpeg'),
    ],
    [
      PlacesModel(Name: 'الترفيهي الأول', Media: 'lib/assets/bg.jpeg'),
      PlacesModel(Name: 'الترفيهي الثاني', Media: 'lib/assets/bg.jpeg'),
    ],
    [
      PlacesModel(Name: 'الثقافي الأول', Media: 'lib/assets/bg.jpeg'),
      PlacesModel(Name: 'الثقافي الثاني', Media: 'lib/assets/bg.jpeg'),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    List<PlacesModel> currentEventList = selectedIndex >= 0 && selectedIndex < eventLists.length
        ? eventLists[selectedIndex]
        : [];
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
          mainAxisAlignment: MainAxisAlignment.start,
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
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.055,
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
                                  shadows: [
                                    const Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xB289875B),
                                  decorationThickness: 2,
                                  decorationStyle: TextDecorationStyle.solid,
                                )
                              : GoogleFonts.notoSansArabic(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF060606),
                                  height: 1)),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xB289875B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    )),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 365 / 390,
              height: MediaQuery.of(context).size.height * 330 / 844,
              child: ListView.builder(
                itemCount: currentEventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 365 / 390,
                    height: MediaQuery.of(context).size.height * 193 / 844,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(currentEventList[index].Media!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.01, 1.00),
                          end: Alignment(0.01, -1),
                          colors: [Color(0xFF89875B), Color(0x0089875B)],
                        ),
                      ),
                      child: Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*3/390),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  // SharedPreferences prefs =
                                  //     await SharedPreferences.getInstance();
                                  // String data = jsonEncode(places[index]);
                                  // prefs.setString(places[index].Name!, data);
                                },
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Text(
                              currentEventList[index].Name!,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.notoSansArabic(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
