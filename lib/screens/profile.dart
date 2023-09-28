import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: -1.0, end: 0.0),
        duration: const Duration(seconds: 1),
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(value * MediaQuery.of(context).size.width, 0.0),
            child: child,
          );
        },
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                "https://ahmadalfrehan.com/assets/assets/images/logo.jpg"))),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 10),
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://ahmadalfrehan.com/assets/assets/images/ahmad.jpg"),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Profile name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 19,
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text("details about")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ListTile(
                                leading: Text('12'),
                                title: Text('Some info about person'));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
