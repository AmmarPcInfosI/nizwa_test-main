import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nizwa_test/screens/home_screen.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String countryValue = "";
  String phoneValue = "";
  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
    );

    return emailRegex.hasMatch(email);
  }

  bool isPhoneNumberValid(String phoneNumber) {
    final RegExp phoneRegex = RegExp(
      r'^[7-9]\d{7}$',
      caseSensitive: false,
    );

    return phoneRegex.hasMatch(phoneNumber);
  }

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _passwordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void writeUsers() async {
    var db = FirebaseFirestore.instance;
    CollectionReference collectionReference = db.collection("Users");

    // [START get_started_read_data]
    await collectionReference.add({
      "userID": "1",
      "userName": nameController.text.toString(),
      "userEmail": emailController.text.toString(),
      "userPassword": _passwordController.text.toString(),
      "userPhone": phoneValue,
      "userNationality": countryValue,
    }).then((value) {
      print("added");
    }).catchError((e) {
      print(e.toString());
    });
  }

  signUp(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/bg.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 361 / 390,
              height: MediaQuery.sizeOf(context).height * 545 / 844,
              decoration: ShapeDecoration(
                color: const Color(0xB289875B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 28 / 844),
                    child: Text(
                      'انشاء حساب',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSansArabic(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 38 / 844),
                      width: MediaQuery.sizeOf(context).width * 332 / 390,
                      height: MediaQuery.sizeOf(context).height * 46 / 844,
                      child: TextFormField(
                        controller: nameController,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'الاسم الثلاثي',
                          alignLabelWithHint: false,
                          hintStyle: GoogleFonts.notoSansArabic(
                            color: const Color(0xFF89875B),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF89875B),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 18 / 844),
                      width: MediaQuery.sizeOf(context).width * 332 / 390,
                      height: MediaQuery.sizeOf(context).height * 46 / 844,
                      child: TextFormField(
                        controller: emailController,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'البريد الالكتروني',
                          alignLabelWithHint: false,
                          hintStyle: GoogleFonts.notoSansArabic(
                            color: const Color(0xFF89875B),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF89875B),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 18 / 844,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 332 / 390,
                    height: MediaQuery.sizeOf(context).height * 75 / 844,
                    child: IntlPhoneField(
                      showCountryFlag: false,
                      focusNode: focusNode,
                       style: GoogleFonts.notoSansArabic(
                          color: const Color(0xFF89875B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      invalidNumberMessage: "رقم الهاتف غير صالح",
                      searchText: "بحث رمز الدولة",
                      dropdownDecoration: BoxDecoration(),
                      decoration: InputDecoration(
                        hintText: 'رقم الهاتف',
                        alignLabelWithHint: false,
                        hintStyle: GoogleFonts.notoSansArabic(
                          color: const Color(0xFF89875B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height:4.9,
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 332 / 390,
                    // height: MediaQuery.of(context).size.height * 46 / 844,
                    child: CSCPicker(
                      showCities: false,
                      flagState: CountryFlag.DISABLE,
                      countrySearchPlaceholder: "الجنسية",
                      countryDropdownLabel: "الجنسية",
                      defaultCountry: CscCountry.Oman,
                      showStates: false,
                      dropdownDecoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20),
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
                  Container(
                    width: MediaQuery.sizeOf(context).width * 332 / 390,
                    height: MediaQuery.sizeOf(context).height * 46 / 844,
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      autofocus: false,
                      textAlign: TextAlign.right,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
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
                        fillColor: const Color(0xFFD9D9D9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'كلمة المرور',
                        prefixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF89875B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 37 / 844,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String fullName = nameController.text;
                      String email = emailController.text;
                      String nationality = countryValue;
                      String phoneNumber = phoneValue;
                      String password = _passwordController.text;

                      if (fullName.isEmpty ||
                          email.isEmpty ||
                          nationality.isEmpty ||
                          phoneNumber.isEmpty ||
                          password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'أكمل كافة الحقول',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (!isEmailValid(email)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'أدخل بريد الكتروني صالح',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (!isPhoneNumberValid(phoneNumber)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'الرجاء إدخال رقم هاتف صالح',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (password.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (!password.contains(RegExp(r'[a-z]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل.',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (!password.contains(RegExp(r'[A-Z]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else if (!password
                          .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل.',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      } else {
                        signUp(
                          emailController.text.toString(),
                          _passwordController.text.toString(),
                        );
                        writeUsers();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF96945E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 149 / 390,
                        MediaQuery.of(context).size.height * 51 / 844,
                      ),
                    ),
                    child: Text(
                      'انشاء حساب',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSansArabic(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
