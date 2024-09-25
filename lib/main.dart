import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF4da454),
        body: Center(
          child: Column(
            children: [
              // show logo image from assets folder
              Image.asset('logo.png'),

              // make a button with 6
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
                    side: WidgetStateProperty.all(
                        BorderSide(color: Colors.white, width: 2)),
                    backgroundColor: WidgetStateProperty.all(Color(0xFFffd136)),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    child: Text(
                      "إبدأ",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
