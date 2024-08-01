import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/sizing.dart';
import '../../../../theme/colors.dart';
import '../views/custom_paint.dart';
import '../widgets/connection_avatar.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height / 100;
    final _width = MediaQuery.of(context).size.width / 100;
    return Container(
      decoration: const BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(_height * ScreenSize.kSpaceL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(_width * 100,
                        350), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIRTUAL\nCONNECTION',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'WITH BEAUTIFUL WORLD',
                      ),
                    ],
                  ),
                  Positioned(
                    top: 50,
                    left: 5,
                    child: ConnectionAvatar(
                      img: Assets.person1,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: ConnectionAvatar(
                      img: Assets.person2,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 0,
                    child: ConnectionAvatar(
                      img: Assets.person3,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 0,
                    child: ConnectionAvatar(
                      img: Assets.person4,
                    ),
                  ),
                ],
              ),
              SizedBox(height: _height * 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Sign In'),
              ),
              SizedBox(height: _height * 3),
              ElevatedButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.resolveWith<BorderSide>(
                      (Set<WidgetState> states) {
                    return const BorderSide(color: Colors.grey);
                  }),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
