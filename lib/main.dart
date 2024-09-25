import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ksanday_app/regions_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              // three division of color each with expanded from top to bottom
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(color: const Color(0xFF00b4b3)),
                    Center(child: Image.asset('logo.png')),
                  ],
                ),
              ),
              const Divider(
                thickness: 10,
                height: 4,
                color: Color(0xFF008f8f),
              ),
              const Divider(
                thickness: 10,
                height: 6,
                color: Color(0xFFfb5730),
              ),
              const Divider(
                thickness: 10,
                height: 6,
                color: Color(0xFFff7516),
              ),
              const Divider(
                thickness: 10,
                height: 6,
                color: Color(0xFF4da455),
              ),
              const Divider(
                thickness: 10,
                height: 6,
                color: Color(0xFFa8c545),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(color: Colors.white),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FilledButton(

                            // border white
                            style: ButtonStyle(
                              // border radius
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // white border
                              side: WidgetStateProperty.all(const BorderSide(
                                  color: Color(0xFF006948), width: 5)),
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFF10a546)),
                            ),
                            onPressed: () {
                              Get.to(() => const RegionsPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 40, right: 40, top: 10, bottom: 10),
                              child: Text(
                                "إبدأ",
                                style: TextStyle(
                                    fontFamily: "IBMPLEX",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                            )),
                        const SizedBox(height: 20),
                        const Text("Made By Mhmd & Hassn")
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
