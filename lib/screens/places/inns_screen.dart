import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/components/grid_view.dart';
import 'package:nizwa_test/models/all_places.dart';
import 'package:nizwa_test/screens/fav_screen.dart';
import 'package:nizwa_test/screens/notifications.dart';

class InnsScreen extends StatefulWidget {
  const InnsScreen({super.key});

  @override
  State<InnsScreen> createState() => _InnsScreenState();
}

class _InnsScreenState extends State<InnsScreen> {
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
  ];

  late Widget gridwidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gridwidget = GridViewCustom(
      places: Places,
      itemscount: Places.length,
    );
  }

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
                      'النزل',
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xFF89875B),
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: gridwidget,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
