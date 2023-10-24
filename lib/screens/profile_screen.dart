import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nizwa_test/screens/notifications.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  
  FocusNode focusNode = FocusNode();
  String phoneValue = "";
  String countryValue = "";

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
                    height: MediaQuery.sizeOf(context).height * 75 / 844,
                    child: IntlPhoneField(
                      showCountryFlag: false,
                      focusNode: focusNode,
                      style: GoogleFonts.notoSansArabic(
                        color: const Color(0xFF89875B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.8,
                      ),
                      invalidNumberMessage: "رقم الهاتف غير صالح",
                      searchText: "بحث رمز الدولة",
                      dropdownDecoration: BoxDecoration(),
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
                      languageCode: "ar",
                      initialCountryCode: 'OM',
                      onChanged: (phone) {
                        setState(() {
                          phoneValue = phone.completeNumber;
                        });
                      },
                    ),
                  ),
                  
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
                 
                  Container(width: MediaQuery.of(context).size.width * 340 / 390,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Set the border color here
                        // Set the border width here
                      ),
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: CSCPicker(
                      showCities: false,
                      flagState: CountryFlag.DISABLE,
                      countrySearchPlaceholder: "الجنسية",
                      countryDropdownLabel: "الجنسية",
                      defaultCountry: CscCountry.Oman,
                      showStates: false,
                      dropdownDecoration: BoxDecoration(
                        color: const Color(0x00C4C4C4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledDropdownDecoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      selectedItemStyle: TextStyle(
                          color: const Color(0xFF89875B),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1),
                      dropdownDialogRadius: 20,
                      dropdownItemStyle: TextStyle(
                        color: const Color(0xFF89875B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      onStateChanged: (value) {},

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {},
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
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
