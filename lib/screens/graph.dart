import 'package:deeplinking/screens/profile.dart';
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 3000),
        child: Center(
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 20),
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeOutCubic,
            builder: (BuildContext context, double value, Widget? child) {
              return Hero(
                tag: 'cardHero',
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.green, radius: 90),
                    CircleAvatar(backgroundColor: Colors.blue, radius: 70),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return Profile(); // Replace with your second page widget
                              },
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0); // Define the animation start position
                                const end = Offset.zero; // Define the animation end position
                                const curve = Curves.easeInOut; // Define animation curve

                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child, // The child is your SecondPage() widget
                                );
                              },
                            ),
                          );

                        },
                        child: const CircleAvatar(
                            backgroundColor: Colors.red, radius: 50)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
