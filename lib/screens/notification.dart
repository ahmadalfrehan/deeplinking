import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Text('12'),
                title: Text('notification title'));
          },
        ),
      ),
    );
  }
}
