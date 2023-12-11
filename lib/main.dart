import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solarpower_tcc/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox('Formulario');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            Colors.amber, /*textTheme: GoogleFonts.robotoSerifTextTheme()*/
      ),
      home: const LoginPage(),
    );
  }
}
