import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  double opacity = 0;


  @override
  void initState() {
    _startOpacity();
    super.initState();
  }

  _startOpacity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: opacity,
              child: Text("Hello",
                style: GoogleFonts.kaushanScript(
                    textStyle: const TextStyle(
                        fontSize: 100,
                        color: Colors.black26
                    )
                )
              ),
            )
        ),

      ),
    );
  }
}
