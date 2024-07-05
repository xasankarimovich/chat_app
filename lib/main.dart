// import 'package:chat_app/services/local_notification_services.dart';
// import 'package:flutter/material.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await LocalNotificationsService.start();
//
//   runApp(const MainApp());
// }
//
// class MainApp extends StatefulWidget {
//   const MainApp({super.key});
//
//   @override
//   State<MainApp> createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       Duration.zero,
//       () async {
//         if (!LocalNotificationsService.notificationsEnabled) {
//           await LocalNotificationsService.requestPermission();
//           setState(() {});
//         }
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (!LocalNotificationsService.notificationsEnabled)
//               const Text(
//                 "Siz xabarnomaga ruxsat bermadingiz shu sabab sizga xabarnomalar kelmaydi."
//                 "\nBuni to'g'irlash uchun sozlamalarga borib to'girlang",
//               ),
//             FilledButton(
//               onPressed: () {
//                 LocalNotificationsService.showNotification();
//               },
//               child: const Text("Oddiy Xabarnoma"),
//             ),
//             FilledButton(
//               onPressed: () {
//                 LocalNotificationsService.showScheduledNotification();
//               },
//               child: const Text("Rejali Xabarnoma"),
//             ),
//             FilledButton(
//               onPressed: () {
//                 LocalNotificationsService.showPeriodicNotification();
//               },
//               child: const Text("Davomiy Xabarnoma"),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }





import 'package:chat_app/views/screens/chat_screen.dart';
import 'package:chat_app/views/screens/contact_screen.dart';
import 'package:chat_app/views/screens/home_screen.dart';
import 'package:chat_app/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_provider/auth_provider.dart';
import 'auth_provider/message_provider.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthServices()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => AuthWrapper(),
          '/login': (context) => LoginScreen(),
          '/profile': (context) => ProfileScreen(),
          '/contacts': (context) => ContactsScreen(),
          '/chat': (context) => ChatScreen(chatId: 'default'),
        },
      ),
    );
  }
}


class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<FirebaseAuthServices>(context);

    return authProvider.isLoggedIn ? HomeScreen() : LoginScreen();
  }
}
