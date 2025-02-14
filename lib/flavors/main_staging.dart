import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopease/app/shopease_app.dart';
import 'package:shopease/utils/enums.dart';

import '../core/configurations/app_config.dart';
import '../core/service/Theme_provider.dart';
import '../core/service/dependency_injection.dart' as di;
import '../features/data/models/responses/product_data_reponse.dart';
import '../utils/app_colors.dart';
import 'flavor_config.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  FlavorConfig(
      flavor: Flavor.STG, color: Colors.black38, flavorValues: FlavorValues());

  WidgetsFlutterBinding.ensureInitialized();

  if (AppConfig.deviceOS == DeviceOS.ANDROID) {
    await Firebase.initializeApp();
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    } catch (e) {
      log('Firebase : ${e.toString()}');
    }
  } else {}

  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(StoreAdapter());

  await Hive.initFlutter();
  await di.setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.initColors().buttonColor,
  ));

  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: ShopEase(),
        );
      },
    ),
  );
}
