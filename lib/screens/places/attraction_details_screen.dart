import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nizwa_test/screens/bootom_sheet.dart';

class AttractionDetailsScreen extends StatefulWidget {
  const AttractionDetailsScreen({super.key});

  @override
  State<AttractionDetailsScreen> createState() =>
      _AttractionDetailsScreenState();
}

class _AttractionDetailsScreenState extends State<AttractionDetailsScreen> {
  List<String> imges = [
    'lib/assets/bg.jpeg',
    'lib/assets/bg.jpeg',
    'lib/assets/bg.jpeg'
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height,
                  autoPlay: true,
                ),
                items: [
                  0,
                  1,
                  2,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Image(
                              image: AssetImage(imges[i]),
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
              //BottomSheetBasedOnContentHeight(),
              const BottomSheetBasedOnContentHeight2(),
            ],
          ),
        ),
      ),
    );
  }
}
