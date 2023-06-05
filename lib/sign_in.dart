import 'dart:developer';
import 'package:eng_heba_project/profile_screen/view/profile_screen.dart';
import 'burger.dart';
import 'home_page.dart';
import 'logged_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isVisable = true;

  late String username;
  late String password;

  late GlobalKey<FormState> key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
    // usernameController = TextEditingController();
    // passContoller = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    // usernameController.dispose();
    // passContoller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                        height: 180,
                        width: 180,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: Image.asset('assets/logo3.jpg')),
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/svgs/user.svg',
                                  color: const Color(0xff8F8F8F),
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.contain,
                                  matchTextDirection: true,
                                ),
                              ),

                              hintText: 'إسم المستخدم',
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: GoogleFonts.vazirmatn().copyWith(
                                fontSize: 14,
                                color: const Color(0xffC2C2C2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your email';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              username = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            obscureText: isVisable,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/svgs/password.svg',
                                  color: const Color(0xff8F8F8F),
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.contain,
                                  matchTextDirection: true,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.indigo,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisable = !isVisable;
                                    });
                                  }),
                              hintText: 'كلمة المرور',
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: GoogleFonts.vazirmatn().copyWith(
                                fontSize: 14,
                                color: const Color(0xffC2C2C2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your password';
                              }
                              ;

                              if (value.length < 8 &&
                                  username == 'mohamed@gmail.com') {
                                Fluttertoast.showToast(
                                    msg: "Please Enter at least 8 chars",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 18),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 96, 177, 243)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15))),
                      onPressed: _signInWithForm,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'تسجيل دخول',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Logged_up(),
                            ));
                      },
                      child: const Text(
                        'تسجيل جديد',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "ليس لديك حساب؟",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
                Container(
                  color: Colors.amber,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInWithForm() {
    if (!key.currentState!.validate()) return;
    key.currentState?.save();
    log('email:$username\npassword:$password');
    if (username == 'mohamed@gmail.com' && password == '12345678') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      final snackBar = SnackBar(
        content: const Text('Welcome to my App',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        dismissDirection: DismissDirection.up,
        padding: EdgeInsets.all(7),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'إخفاء',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Fluttertoast.showToast(
          msg: 'You are logged successfully',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.pink,
          fontSize: 16.0);
      return;
    } else {
      Fluttertoast.showToast(
          msg: 'please correct your data..',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.indigo,
          fontSize: 16.0);
    }
  }
}
