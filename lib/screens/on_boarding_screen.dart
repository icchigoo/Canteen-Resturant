import 'package:canteen_app/auth/sign_in.dart';
import 'package:canteen_app/route/routing_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val) {
              setState(() {
                scrollPosition = val.toDouble();
              });
            },
            children: [
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome\nTo  foodie App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '+30  Products\n  +3 Categories\n +20 Brands ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 28),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/1.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '24 hr active',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      ' Satisfication Guaranted ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/2.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Find Your Favourate Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/3.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Experience Smart fooding',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/4.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Safe and Secure\n Payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/5.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 5,
                  position: scrollPosition,
                  decorator: const DotsDecorator(activeColor: Colors.white),
                ),
                scrollPosition == 4
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepOrange)),
                          onPressed: () {
                            RoutingPage.goTonext(
                                context: context, navigateTo: SignIn());
                          },
                          child: const Text('Start fooding'),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          RoutingPage.goTonext(
                            context: context,
                            navigateTo: SignIn(),
                          );
                        },
                        child: const Text(
                          'SKIP TO THE APP > ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                const SizedBox(
                  height: 17,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardPage({Key? key, this.boardColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepOrange,
          child: Center(child: boardColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            decoration: BoxDecoration(
                color: Colors.blueGrey[600],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
          ),
        ),
      ],
    );
  }
}
