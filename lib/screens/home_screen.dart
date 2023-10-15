import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/components/grid_view.dart';
import 'package:nizwa_test/models/all_places.dart';

import 'package:nizwa_test/screens/places/attractions_screen.dart';
import 'package:nizwa_test/screens/places/cafes_screen.dart';
import 'package:nizwa_test/screens/places/events_screen.dart';
import 'package:nizwa_test/screens/fav_screen.dart';
import 'package:nizwa_test/screens/places/inns_screen.dart';
import 'package:nizwa_test/screens/notifications.dart';
import 'package:nizwa_test/screens/places/resturants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> catigories = [
    "المعالم",
    'نزل',
    'مطاعم',
    "كافيهات",
    'فعاليات',
  ];
  List<PlacesModel> Places = [
    PlacesModel(Type: 'Res', Name: 'ليوان ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Res', Name: 'العقر ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Res', Name: 'براتا جبن ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Res', Name: 'البريد ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Res', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Res', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'اناة', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'نز ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'اثر', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'غير ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'غير ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Cafe', Name: 'غير ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Inn', Name: 'نزل نزوى ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Inn', Name: 'نزل البستان ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(
        Type: 'Inn', Name: 'نزل بيت المعلم ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Inn', Name: 'نزل الحارة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Inn', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Inn', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'العربات ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'السكوترات ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'الجولات ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'هايك ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Event', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    PlacesModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
  ];

  List<PlacesModel> attractions = [];
  List<PlacesModel> cafes = [];
  List<PlacesModel> resturants = [];
  List<PlacesModel> inns = [];
  List<PlacesModel> events = [];

  late Widget gridwidget;
  late var showAll;

  @override
  void initState() {
    super.initState();
    seperate();
    showAll = const AttrationsScreen();
    gridwidget = GridViewCustom(
      places: attractions,
      itemscount: 4,
    );
  }

  void seperate() {
    for (var element in Places) {
      if (element.Type == 'Att') {
        attractions.add(element);
      } else if (element.Type == 'Res') {
        resturants.add(element);
      } else if (element.Type == 'Event') {
        events.add(element);
      } else if (element.Type == 'Inn') {
        inns.add(element);
      } else if (element.Type == 'Cafe') {
        cafes.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    seperate();
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavScreen(
                        places: Places,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite,
                    size: 30, color: Color.fromARGB(255, 137, 135, 91)))
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.02,
          right: MediaQuery.sizeOf(context).width * 0.02,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اكتشف',
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xFF89875B),
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    Text(
                      'افضل الاماكن في نزوى',
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
                width: MediaQuery.sizeOf(context).width * 340/390,
                height: MediaQuery.sizeOf(context).height * 46/844,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SearchBar(onTap: () {
                    
                  },
                    leading: const Icon(Icons.search,color: Colors.white,),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 137, 135, 91)),
                    hintText: 'ابحث عن وجهتك',
                    hintStyle:MaterialStateProperty.all(GoogleFonts.notoSansArabic(color: Colors.white,)),
                    textStyle:MaterialStateProperty.all(GoogleFonts.notoSansArabic(color: Colors.white,)),
                    constraints: const BoxConstraints(maxHeight: 46, maxWidth: 340),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.01,
                ),
                height: MediaQuery.sizeOf(context).height * 0.05,
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: catigories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                          onPressed: () {
                            if (index == 0) {
                              showAll = const AttrationsScreen();
                              setState(() {
                                gridwidget = GridViewCustom(
                                  places: attractions,
                                  itemscount: 4,
                                );
                              });
                            } else if (index == 1) {
                              showAll = const InnsScreen();
                              setState(() {
                                gridwidget = GridViewCustom(
                                  places: inns,
                                  itemscount: 4,
                                );
                              });
                            } else if (index == 2) {
                              showAll = const ResturantsScreen();
                              setState(() {
                                gridwidget = GridViewCustom(
                                  places: resturants,
                                  itemscount: 4,
                                );
                              });
                            } else if (index == 3) {
                              setState(() {
                                showAll = const CafesScreen();

                                gridwidget = GridViewCustom(
                                  places: cafes,
                                  itemscount: 4,
                                );
                              });
                            } else if (index == 4) {
                              showAll = const EventsScreen();
                              setState(() {
                                gridwidget = GridViewCustom(
                                  places: events,
                                  itemscount: 4,
                                );
                              });
                            }
                          },
                          child: Text(
                              textAlign: TextAlign.right,
                              catigories[index],
                              style: GoogleFonts.notoSansArabic(
                                fontSize: 18,
                                fontWeight:  FontWeight.w400,
                                color:  const Color(0xFF060606),
                                height: 1
                              )));
                    }),
              ),
              Container(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => showAll,
                              ),
                            );
                          },
                          child: const Text(
                            'عرض الكل',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 137, 135, 91)),
                          )),
                      Expanded(child: gridwidget)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
