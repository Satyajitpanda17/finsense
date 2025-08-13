import 'package:finsense/common/widgets/bootom_bar.dart';
import 'package:finsense/data/model/add_data.dart';
import 'package:finsense/views/screens/auth/screens/singup_screen.dart';
import 'package:finsense/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:finsense/providers/theme_provider.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AddDataAdapter());
  await Hive.openBox<AddData>('data');
  runApp (ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'FinSense',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xff368983),
      surface: Colors.grey.shade100,
      onPrimary: Colors.black,
    ),
    cardColor: Colors.white,
  ),
      darkTheme: ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xff368983),
      surface: Color(0xFF121212),
      onPrimary: Colors.white,
    ),
    cardColor: Color(0xFF1E1E1E),
  ),
  //themeMode: ThemeMode.system,
      home: const SignupScreen()
    );
  }
}

