import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPwdScreen extends StatefulWidget {
  const ForgetPwdScreen({super.key});

  @override
  State<ForgetPwdScreen> createState() => _ForgetPwdScreenState();
}

class _ForgetPwdScreenState extends State<ForgetPwdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            height: MediaQuery.sizeOf(context).height * 277 / 844,
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
                      top: MediaQuery.sizeOf(context).height * 42 / 844),
                  child: Text(
                    'استعادة كلمة المرور',
                    textAlign: TextAlign.right,
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
                        top: MediaQuery.sizeOf(context).height * 37 / 844),
                    width: MediaQuery.sizeOf(context).width * 332 / 390,
                    height: MediaQuery.sizeOf(context).height * 46 / 844,
                    child: TextFormField(
                      
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
                  height: MediaQuery.sizeOf(context).height * 16 / 844,
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF96945E), // Set the background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 149 / 390,
                      MediaQuery.of(context).size.height * 51 / 844,
                    ),
                  ),
                  child: Text(
                    'استعادة كلمة المرور',
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
    );
  }
}