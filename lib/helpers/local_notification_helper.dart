import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationHelper {
  LocalNotificationHelper._();
  static final LocalNotificationHelper localNotificationHelper =
      LocalNotificationHelper._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initNotification() {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    DarwinInitializationSettings ios = const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: ios);
    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  showSimple() {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "101",
      "Flutter",
      priority: Priority.max,
      importance: Importance.high,
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationsPlugin.show(
        101, "Simple title", "Simple body", notificationDetails);
  }

  showSchedule() {
    tz.initializeTimeZones();

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "101",
      "Flutter",
      priority: Priority.max,
      importance: Importance.high,
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationsPlugin.zonedSchedule(
        101,
        "Scheduled",
        "Scheduled body",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  showMediaStyle() {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "101",
      "Flutter",
      priority: Priority.max,
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound("tone"),
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationsPlugin.show(
        101, "Simple title", "Simple body", notificationDetails);
  }

  showBigPicture() {
    var bigPictureStyleInformation = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("ic_launcher"),
      largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
      summaryText: "Open image",
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "101",
      "Flutter",
      priority: Priority.max,
      importance: Importance.high,
      styleInformation: bigPictureStyleInformation,
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationsPlugin.show(
        101, "Simple title", "Simple body", notificationDetails);
  }
}
