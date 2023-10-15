import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/components/grid_view.dart';
import 'package:nizwa_test/models/all_places.dart';

import 'package:nizwa_test/screens/notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavScreen extends StatefulWidget {
  FavScreen({
    super.key,
    required this.places,
  });
  List<PlacesModel> places = [];

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late List<PlacesModel> fav = [];
  late Widget gridwidget;
  @override
  void initState() {
    _getData();

    // TODO: implement initState
    super.initState();

    print(fav.length);
    gridwidget = GridViewCustom(
      places: fav,
      itemscount: fav.length,
    );
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var element in widget.places) {
      if (prefs.containsKey(element.Name!)) {
        fav.add(element);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.places.length);
    print(
      fav.length,
    );
    var itemcount = fav.length;
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
                  icon: const Icon(Icons.notifications,
                      size: 30,
                      color: Color.fromARGB(255, 137, 135, 91))),
              IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => FavScreen(),
                    //   ),
                    // );
                  },
                  icon: const Icon(Icons.favorite,
                      size: 30, color: Color.fromARGB(255, 137, 135, 91)))
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.02,
            right: MediaQuery.sizeOf(context).width * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.15,
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
                        'مفضلتك من العروض والفعاليات في نزوى',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.notoSansArabic(
                          color: const Color(0xFF89875B),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: GridViewCustom(
                          places: fav,
                          itemscount: fav.length,
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
