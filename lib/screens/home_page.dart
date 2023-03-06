import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:istighfar/config/palette.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  late Stream _stream;

  @override
  void initState() {
    super.initState();
    if (box.read('count') == null && box.read('times') == null) {
      box.write('count', 0);
      box.write('times', 0);
    }
    box.listen(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Istighfar Counter',
      //     style: TextStyle(
      //       fontSize: 22.0,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: Palette.appColor,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.bottomSlide,
            title: 'Delete',
            desc: 'Are you sure you want to clear ?',
            btnCancelOnPress: () {},
            btnOkOnPress: () async {
              box.write('count', 0);
              box.write('times', 0);
            },
          ).show();
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.delete_outline_outlined,
        ),
      ),
      backgroundColor: Palette.appColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              AppBar(
                title: Text(
                  'Istighfar',
                  style: GoogleFonts.aboreto(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 10.h,
              ),
              GlassmorphicContainer(
                width: 60.w,
                height: 15.h,
                borderRadius: 40,
                blur: 40,
                alignment: Alignment.bottomCenter,
                border: 2,
                linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ],
                ),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.0),
                    Color((0xFFFFFFFF)).withOpacity(0.0),
                  ],
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${box.read('times')}',
                            style: GoogleFonts.sourceCodePro(
                              fontSize: 30.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Times',
                            style: GoogleFonts.sourceCodePro(
                              fontSize: 15.0.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${box.read('count')}',
                            style: GoogleFonts.sourceCodePro(
                              fontSize: 30.0.sp,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Counts',
                            style: GoogleFonts.sourceCodePro(
                              fontSize: 15.0.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 180,
                height: 180,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () {
                    if (box.read('count') == 100) {
                      box.write('times', box.read('times') + 1);
                    }
                    box.write('count', box.read('count') + 1);
                  },
                  child: GlassmorphicContainer(
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: 100,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.0),
                        Color((0xFFFFFFFF)).withOpacity(0.0),
                      ],
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 45.sp,
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: Text(
                          'Press',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
