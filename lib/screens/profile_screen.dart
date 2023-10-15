import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/notifications.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  // Replace this with your list of nationalities.
  final List<String> allNationalities = [
    'أفغاني',
    'ألباني',
    'جزائري',
    'ألماني',
    'أندوري',
    'أنغولي',
    'أنتيغوان وبربودا',
    'أرجنتيني',
    'أرمني',
    'أسترالي',
    'نمساوي',
    'أذربيجاني',
    'باهامي',
    'بحريني',
    'بنغالي',
    'باربادوسي',
    'بيلاروسي',
    'بلجيكي',
    'بليزي',
    'بنيني',
    'بوتاني',
    'بوليفي',
    'البوسنة والهرسك',
    'بوتسواني',
    'برازيلي',
    'بروناي',
    'بلغاري',
    'بوركيني فاسو',
    'بوروندي',
    'كمبودي',
    'كاميروني',
    'كندي',
    'الرأس الأخضر',
    'تشادي',
    'تشيلي',
    'صيني',
    'كولومبي',
    'جزر القمر',
    'الكونغو',
    'كوستاريكي',
    'كرواتي',
    'كوبي',
    'قبرصي',
    'تشيكي',
    'دانماركي',
    'جيبوتي',
    'دومينيكي',
    'جمهورية الدومينيكان',
    'تيموري',
    'إكوادوري',
    'مصري',
    'سلفادوري',
    'غيني',
    'إستوني',
    'إثيوبي',
    'فيجي',
    'فنلندي',
    'فرنسي',
    'غابوني',
    'غامبي',
    'جورجي',
    'ألماني',
    'غاني',
    'يوناني',
    'جرينادي',
    'جواتيمالي',
    'غيني',
    'غينيا بيساوي',
    'غوياني',
    'هندوراسي',
    'هونغ كونغ',
    'مجري',
    'أيسلندي',
    'هندي',
    'إندونيسي',
    'إيراني',
    'عراقي',
    'إيرلندي',
    'إسرائيلي',
    'إيطالي',
    'إيفواري',
    'جامايكي',
    'ياباني',
    'أردني',
    'كازاخستاني',
    'كيني',
    'كيريباتي',
    'كويتي',
    'قيرغيزي',
    'لاوسي',
    'لاتفي',
    'لبناني',
    'ليسوتي',
    'ليبيري',
    'ليبي',
    'ليختنشتايني',
    'ليتواني',
    'لوكسمبورجي',
    'مكاوي',
    'مقدوني',
    'مدغشقري',
    'مالاوي',
    'ماليزي',
    'مالديفي',
    'مالي',
    'مالطي',
    'جزر مارشال',
    'موريتاني',
    'موريشيوسي',
    'مكسيكي',
    'ميكرونيزي',
    'مولدوفي',
    'موناكو',
    'منغولي',
    'مونتيغريني',
    'المغربي',
    'موزمبيقي',
    'بورمي',
    'ناميبي',
    'ناورو',
    'نيبالي',
    'هولندي',
    'نيوزيلندي',
    'نيكاراغواني',
    'نيجيري',
    'كوري شمالي',
    'نرويجي',
    'عماني',
    'باكستاني',
    'بالاوي',
    'فلسطيني',
    'بنمي',
    'بابوا غينيا الجديدة',
    'باراغواي',
    'بيرو',
    'فلبيني',
    'بولندي',
    'برتغالي',
    'قطري',
    'روماني',
    'روسي',
    'رواندي',
    'سان كريستوفر ونيفيس',
    'سانت لوسيان',
    'سانت فينسنت وجزر غرينادين',
    'ساموي',
    'سان مارينو',
    'ساو تومي وبرينسيبي',
    'سعودي',
    'سنغالي',
    'صربي',
    'سيشيلي',
    'سيراليوني',
    'سنغافوري',
    'سلوفاكي',
    'سلوفيني',
    'جزر سليمان',
    'صومالي',
    'جنوب أفريقي',
    'كوريا الجنوبية',
    'جنوب السودان',
    'إسباني',
    'سريلانكي',
    'السوداني',
    'سوري',
    'سوازيلندي',
    'سويدي',
    'سويسري',
    'سورينامي',
    'سواهيلي',
    'طاجيكي',
    'تنزاني',
    'تايلاندي',
    'توغوي',
    'تونغاني',
    'ترينيدادي',
    'تونسي',
    'تركي',
    'تركمانستاني',
    'توفالوي',
    'أوغندي',
    'أوكراني',
    'إماراتي',
    'بريطاني',
    'أمريكي',
    'أوروغواي',
    'أوزبكستاني',
    'فانواتو',
    'فنزويلي',
    'فيتنامي',
    'اليمني',
    'زامبي',
    'زمبابوي',
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
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 21 / 390),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الملف",
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xFF89875B),
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    Text(
                      'الشخصي',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 21 / 844,
                  ),
                  Text(
                    'الاسم الثلاثي',
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 6 / 844),
                      width: MediaQuery.sizeOf(context).width * 340 / 390,
                      height: MediaQuery.sizeOf(context).height * 44 / 844,
                      child: TextFormField(
                        controller: nameController,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          alignLabelWithHint: false,
                          hintStyle: GoogleFonts.notoSansArabic(
                            color: const Color(0xFF89875B),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          filled: true,
                          fillColor: const Color(0x00C4C4C4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF89875B),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 21 / 844,
                  ),
                  Text(
                    'البريد الالكتروني',
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 6 / 844),
                      width: MediaQuery.sizeOf(context).width * 340 / 390,
                      height: MediaQuery.sizeOf(context).height * 44 / 844,
                      child: TextFormField(
                        controller: emailController,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          alignLabelWithHint: false,
                          hintStyle: GoogleFonts.notoSansArabic(
                            color: const Color(0xFF89875B),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          filled: true,
                          fillColor: const Color(0x00C4C4C4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF89875B),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 21 / 844,
                  ),
                  Text(
                    "رقم الهاتف",
                    style: GoogleFonts.notoSansArabic(
                      color: const Color(0xFF89875B),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 6 / 844),
                      width: MediaQuery.sizeOf(context).width * 340 / 390,
                      height: MediaQuery.sizeOf(context).height * 44 / 844,
                      child: TextFormField(
                        controller: phoneController,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          alignLabelWithHint: false,
                          hintStyle: GoogleFonts.notoSansArabic(
                            color: const Color(0xFF89875B),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          filled: true,
                          fillColor: const Color(0x00C4C4C4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF89875B),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 21 / 844,
                  ),
                  const Text(
                    'الجنسية',
                    style: TextStyle(
                      color: Color(0xFF89875B),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 6 / 844),
                    width: MediaQuery.of(context).size.width * 340 / 390,
                    height: MediaQuery.of(context).size.height * 44 / 844,
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: nationalityController,
                          decoration: InputDecoration(
                            alignLabelWithHint: false,
                            hintStyle: const TextStyle(
                              color: Color(0xFF89875B),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: const Color(0x00C4C4C4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF89875B),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right),
                      suggestionsCallback: (pattern) {
                        return allNationalities.where((nationality) {
                          return nationality
                              .toLowerCase()
                              .contains(pattern.toLowerCase());
                        });
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(
                            suggestion,
                            textAlign: TextAlign.right,
                          ),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        nationalityController.text = suggestion;
                      },
                      noItemsFoundBuilder: (context) {
                       
                        return const Padding(
                          padding: EdgeInsets.all(10.0),
                          child:  Text(
                            'لا تتوفر هذه الجنسية',
                            style: TextStyle(
                              color: Colors.black,
                              
                            ),
                            textAlign: TextAlign.right,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 41 / 844,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF96945E), // Set the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 264 / 390,
                          MediaQuery.of(context).size.height * 51 / 844,
                        ),
                      ),
                      child: Text(
                        'تحديث البيانات',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSansArabic(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
