
import 'package:flutter/material.dart';

import 'my_paint.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double animationLogin = -400;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.green[700],
          image: const DecorationImage(
            image: AssetImage("assets/background_main.png",),
            fit: BoxFit.fill
          )

        ),

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    padding: const EdgeInsets.only(top: 120),
                    width: size.width,
                    height: size.height / 2,
                    child:  Stack(
                      alignment: Alignment.center,
                      children: [

                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white38,
                                  blurRadius: 30,
                                spreadRadius: 110
                              )
                            ]

                          ),
                        ),

                        Image.asset("assets/logo.png"),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              animationLogin = 0;
                            });
                          },
                          child: Container(
                            width: size.width *.9,
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

                        const SizedBox(height: 15,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: const [
                              Expanded(child: Divider(color: Colors.white54, thickness: 1,)),
                              SizedBox(width: 10,),
                              Text("Ainda não tem uma conta?", style: TextStyle(color: Colors.white),),
                              SizedBox(width: 10,),
                              Expanded(child: Divider(color: Colors.white54, thickness: 1,))

                            ],
                          ),
                        ),

                        const SizedBox(height: 15,),
                        Container(
                          width: size.width * .9,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Center(
                            child: Text("Criar uma conta",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
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



            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              bottom: animationLogin,
              child: SizedBox(
                height: size.height * .50,
                width: size.width,
                //color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(size.width, size.height * .55),
                      painter: MyPainter(),
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
                          Container(
                            width: size.width,
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

                        ],
                      ),
                    ),


                    Positioned(
                      top: 30,
                        right: 10,
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              FocusScope.of(context).unfocus();
                              animationLogin = -size.height * .55;
                            });
                          },
                          icon: const Icon(Icons.close, color: Colors.white,),

                        )
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


