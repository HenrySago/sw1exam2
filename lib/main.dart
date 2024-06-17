import 'package:examenodoo/screens/calificaciones_screen.dart';
import 'package:examenodoo/screens/home_screen.dart';
import 'package:examenodoo/screens/trimestre2.dart';
import 'package:examenodoo/services/push_notifications_service.dart';
import 'package:flutter/material.dart';

import 'screens/evento_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Context
    PushNotificationsService.messagesStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Education',
      initialRoute: 'home',
      routes: {
        'home': (_) => MyHomePage(),
        'agenda': (_) => AgendaScreen(),
        'calificaciones': (_) => MenuTrimestre(),
        'trimestre2': (_) => Trimestre2Screen(),
        'trimestre3': (_) => Trimestre2Screen(),
        'trimestre1': (_) => Trimestre2Screen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
