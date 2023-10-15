import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/models/all_places.dart';
import 'package:nizwa_test/screens/places/attraction_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GridViewCustom extends StatelessWidget {
  GridViewCustom({super.key, required this.places, required this.itemscount});

  List<PlacesModel> places = [];

  var itemscount = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: itemscount,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AttractionDetailsScreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width * 0.05,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(places[index].Media!),
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
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String data = jsonEncode(places[index]);
                            prefs.setString(places[index].Name!, data);
                          },
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                            color: Colors.white,
                          )),
                      Text(
                        places[index].Name!,
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
        });
  }
}
