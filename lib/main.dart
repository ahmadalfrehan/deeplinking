import 'package:deeplinking/screens/graph.dart';
import 'package:deeplinking/screens/home-screen.dart';
import 'package:deeplinking/screens/notification.dart';
import 'package:deeplinking/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
            path: 'notification',
            builder: (_, __) => const NotificationScreen()),
        GoRoute(path: 'profile', builder: (_, __) => const Profile()),
        GoRoute(path: 'graph', builder: (_, __) => const Graph()),
      ],
    )
  ]);

  runApp(MaterialApp.router(
    routerConfig: router
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

/// modify android manifest file
/// by adding the following :
//  <meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
//  <intent-filter android:autoVerify="true">
//      <action android:name="android.intent.action.VIEW" />
//      <category android:name="android.intent.category.DEFAULT" />
//      <category android:name="android.intent.category.BROWSABLE" />
//      <data android:scheme="http" android:host="example.com" />
//      <data android:scheme="https" />
//  </intent-filter>
/// make an implementation of the go_router package
/// create and upload the assetlinks.json
/// keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
/// [{
//   "relation": ["delegate_permission/common.handle_all_urls"],
//   "target": {
//     "namespace": "android_app",
//     "package_name": "com.example.deeplink_cookbook",
//     "sha256_cert_fingerprints":
//     ["FF:2A:CF:7B:DD:CC:F1:03:3E:E8:B2:27:7C:A2:E3:3C:DE:13:DB:AC:8E:EB:3A:B9:72:A1:0E:26:8A:F5:EC:AF"]
//   }
// }]
/// testing
/// adb shell am start -a android.intent.action.VIEW -d https://ahmadalfrehan.com/ com.ahmadalfrehan.deeplinking