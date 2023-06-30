
import 'package:curstom_paint_login/login/my_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'my_paint2.dart';


class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {

  double animationLoginBottom = -400;
  double animationLoginTop = -400;
  bool isLoading = true;
  double buttonWidth = 400;
  bool buttonLoading = false;



  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    animationLoginBottom = 0;
    animationLoginTop = 0;
   setState(() {});
  }

  _buttonAnimation() async{
    buttonWidth = buttonWidth == 400 ? 60 : 400;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 600));
    buttonLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    _nextPage();
  }

  _nextPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            if(isLoading)
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),

            AnimatedPositioned(
              top: animationLoginTop,
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2 ),
              width: size.width,
              height: size.height/2,
              child: Container(
                child: Lottie.asset("assets/relax_animation.json")
              ),
            ),


            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              bottom: animationLoginBottom,
              child: SizedBox(
                height: size.height * .50,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(size.width, size.height * .55),
                      painter: MyPainter2(),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30 ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text("Email", style: TextStyle(color: Colors.white),),
                          const SizedBox(height: 5,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal:15 ),
                            width: size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: const TextField(),
                          ),

                          const SizedBox(height: 20,),

                          const Text("Senha", style: TextStyle(color: Colors.white),),
                          const SizedBox(height: 5,),
                          Container(
                            width: size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)
                            ),
                          ),


                          const SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("Esqueceu sua senha?", style: TextStyle(color: Colors.white),),
                            ],
                          ),



                          const SizedBox(height: 25,),
                          if(!buttonLoading)
                          GestureDetector(
                            onTap: _buttonAnimation,
                            child: Align(
                              alignment: Alignment.center,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
                                width: buttonWidth,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.orange[400],
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: const Center(
                                  child: Text("Entrar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          if(buttonLoading)
                            Center(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 60,
                              width: 60,
                              child: const CircularProgressIndicator(
                                color: Colors.orange,
                                strokeWidth: 5,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


