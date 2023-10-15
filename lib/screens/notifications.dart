import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/models/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
        Name: 'فعاليات السكوتر',
        N_Icon: const Icon(Icons.bike_scooter),
        Details: 'استمتع بجولة مجانية مع صفرد '),
    NotificationModel(
        Name: 'فعاليات السكوتر',
        N_Icon: const Icon(Icons.bike_scooter),
        Details: 'استمتع بجولة مجانية مع صفرد '),
    NotificationModel(
        Name: 'فعاليات السكوتر',
        N_Icon: const Icon(Icons.bike_scooter),
        Details: 'استمتع بجولة مجانية مع صفرد ')
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
              SizedBox(
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
                      'احدث العروض والفعاليات في نزوى',
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xFF89875B),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.sizeOf(context).height * 0.03),
                          width: MediaQuery.sizeOf(context).width * 0.80,
                          height: MediaQuery.sizeOf(context).height * 0.0972,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 137, 135, 91),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(notifications[index].Name!,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  Text(notifications[index].Details!,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white))
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius:
                                    MediaQuery.sizeOf(context).height * 0.03,
                                child: notifications[index].N_Icon,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
      ),
    );
  }
}
