import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ml_image_detection/view/home.dart';

import 'constant/string.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox(kHiveSystemPrefs);
  FlutterNativeSplash.remove();
  runApp(const RandomFaceGeneratorApp());
}

class RandomFaceGeneratorApp extends StatelessWidget {
  const RandomFaceGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(kHiveSystemPrefs).listenable(),
      builder: (context, box, _) {
        bool isDark = box.get("darkMode",
            defaultValue: ThemeMode.system == ThemeMode.dark);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark ? kdarkTheme : klightTheme,
          home: Home(
            isDark: isDark,
          ),
        );
      },
    );
  }
}