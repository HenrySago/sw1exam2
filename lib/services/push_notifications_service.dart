import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//6C:84:7F:3D:A7:8F:FC:B6:C9:0F:2B:2A:EA:00:CF:4B:47:A5:3E:3D

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // print('onBackground Handler ${message.messageId}');
    print(message.data);

    _messageStream.add(message.notification?.title ?? 'No titulo');
    _messageStream.add(message.notification?.body ?? 'No subtitulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'No titulo');
    _messageStream.add(message.notification?.body ?? 'No subtitulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'No titulo');
    _messageStream.add(message.notification?.body ?? 'No subtitulo');
  }

  static Future initializeApp() async {
    //push notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // options: DefaultFirebaseOptions.currentPlatform,
    //local notification
  }

  static closeStreams() {
    _messageStream.close();
  }
}
