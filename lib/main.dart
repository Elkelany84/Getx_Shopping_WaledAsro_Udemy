import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/theme_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDL4iNHbNdj3JpcXlaKZgrzTbFFtnf1SOM",
            appId: "1:1075996199651:android:0f9b9ef7c4bab30c5793d6",
            messagingSenderId: "1075996199651",
            projectId: "modernshoppinggetx",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemesApp.light,
      themeMode: ThemeController().themeDataGet,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
    );
  }
}
