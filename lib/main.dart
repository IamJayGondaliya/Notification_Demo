import 'package:demo1/helpers/local_notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    LocalNotificationHelper.localNotificationHelper.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                LocalNotificationHelper.localNotificationHelper.showSimple();
              },
              child: const Text("Simple"),
            ),
            ElevatedButton(
              onPressed: () {
                LocalNotificationHelper.localNotificationHelper.showSchedule();
              },
              child: const Text("Schedule"),
            ),
            ElevatedButton(
              onPressed: () {
                LocalNotificationHelper.localNotificationHelper
                    .showMediaStyle();
              },
              child: const Text("MediaStyle"),
            ),
            ElevatedButton(
              onPressed: () {
                LocalNotificationHelper.localNotificationHelper
                    .showBigPicture();
              },
              child: const Text("Big Picture"),
            ),
          ],
        ),
      ),
    );
  }
}
