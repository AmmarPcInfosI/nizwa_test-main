import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/models/all_places.dart';
import 'package:nizwa_test/screens/notifications.dart';

class EventsModel {
  final String Type;
  final String Name;
  final String Media;

  EventsModel({
    required this.Type,
    required this.Name,
    required this.Media,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<EventsModel> Places = [
    EventsModel(Type: 'Res', Name: 'fort', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Res', Name: 'العقر ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Res', Name: 'براتا جبن ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Res', Name: 'البريد ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Res', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Res', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: 'اناة', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: 'نز ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: 'اثر', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: 'غير ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: 'غير ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Cafe', Name: "غير", Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Inn', Name: 'نزل نزوى ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Inn', Name: 'نزل البستان ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(
        Type: 'Inn', Name: 'نزل بيت المعلم ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Inn', Name: 'نزل الحارة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Inn', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Inn', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'العربات ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'السكوترات ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'الجولات ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'هايك ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Event', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
    EventsModel(Type: 'Att', Name: 'قلعة ', Media: 'lib/assets/bg.jpeg'),
  ];

  String searchQuery = "";
  List<EventsModel> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = Places;
  }

  void searchPlaces(String query) {
    setState(() {
      filteredPlaces =
          Places.where((place) => place.Name.contains(query) == true).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.of(context).size.width,
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
                color: Color(0xFF89875B),
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => FavScreen(),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Color(0xFF89875B),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                    'ابحث عن وجهتك في نزوى',
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.045,
                    child: SearchBar(
                      onChanged: (query) {
                        searchPlaces(query);
                      },
                      leading: Icon(Icons.search),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 137, 135, 91)),
                      hintText: 'ابحث عن وجهتك',
                      constraints: BoxConstraints(maxHeight: 46, maxWidth: 340),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: filteredPlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const AttractionDetailsScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.sizeOf(context).width * 0.05,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(filteredPlaces[index].Media),
                                fit: BoxFit.fill),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 137, 135, 91),
                                      Color.fromARGB(20, 137, 135, 91),
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  filteredPlaces[index].Name,
                                  style: GoogleFonts.notoSansArabic(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
