import 'package:eng_heba_project/profile_screen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isVisable = true;
  late String username;
  late String email;
  late String location;
  late String phone;
  late String password;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.indigo,
                tabs: [

                  Tab(
                    text: 'Sign',
                  ),
                  Tab(
                    text: 'Register',
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:  <Widget>[
                    Container(

                      child:  SingleChildScrollView(
                        child: Form(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 22),
                                    child: Text('''Let's choose our favorite Resturant''',
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.indigo,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/user.svg',

                                            color: Colors.indigo,
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.contain,
                                            matchTextDirection: true,
                                          ),
                                        ),

                                        labelText: 'إسم المستخدم',

                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),

                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      obscureText: isVisable,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/password.svg',
                                            color: Colors.indigo,
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
                                        labelText: 'كلمة المرور',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            "ليس لديك حساب؟ اسحب يمينا للتسجيل",
                                            style: TextStyle(color: Colors.black87),
                                          )),

                                    ],
                                    
                                  ),
                                  const SizedBox(height: 18),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Container(
                                      height: 55,
                                      child: ElevatedButton(
                                            style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(
                                                      Colors.indigo),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(22.0),
                                                          side: BorderSide(color: Colors.black)
                                                      ),
                                                  ),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(15))),
                                        onPressed: (){} ,
                                        child: Text(
                                          'تسجيل دخول',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 33,horizontal: 11),
                      child: Container(
                        decoration: BoxDecoration(
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "تسجيل جديد ...",
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.vazirmatn().copyWith(fontSize: 24),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    'قم بإدخال البيانات المطلوبة لإنشاء حساب جديد`',
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.vazirmatn()
                                        .copyWith(fontSize: 16, color: Colors.indigo),
                                  ),
                                  const SizedBox(height: 20),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/user.svg',
                                            color: Colors.indigo,
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.contain,
                                            matchTextDirection: true,
                                          ),
                                        ),
                                        labelText: 'اسم المستخدم',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/phone.svg',
                                            color: Colors.indigo,
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.contain,
                                            matchTextDirection: true,
                                          ),
                                        ),
                                        labelText: 'رقم الهاتف',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/email.svg',
                                            color: Colors.indigo,
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.contain,
                                            matchTextDirection: true,
                                          ),
                                        ),
                                        labelText: 'البريد الإلكتروني',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/location.svg',
                                            color: Colors.indigo,
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.contain,
                                            matchTextDirection: true,
                                          ),
                                        ),
                                        labelText: 'العنوان',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      obscureText: isVisable,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(40)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/svgs/password.svg',
                                            color: Colors.indigo,
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
                                        labelText: 'كلمة المرور ',
                                        hintTextDirection: TextDirection.rtl,
                                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                                          fontSize: 14,
                                          color: const Color(0xffC2C2C2),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 25),
                                  //
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Container(
                                            height: 55,
                                            width: 200,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                            Colors.indigo),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(22.0),
                                                side: BorderSide(color: Colors.black)
                                            )
                                            ),
                                                  padding: MaterialStateProperty.all(
                                                      const EdgeInsets.all(15))),
                                              onPressed: (){
                                                ProfileScreen();
                                              },
                                              child: Text(
                                                'إنشاء الحساب',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void disposee() {
    _tabController.dispose();
    super.dispose();
  }
}