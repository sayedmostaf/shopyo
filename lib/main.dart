import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shopyo/core/app/bloc_observer.dart';
import 'package:shopyo/core/app/env.variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/service/hive/hive_database.dart';
import 'package:shopyo/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:shopyo/core/service/push_notification/local_notfication_service.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';

import 'package:shopyo/shopyo_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: 'AIzaSyCz9NTkuGt6AtLj3LLBa88MNP4sWYTwyqU',
            appId: "1:297809629495:android:177e96d579d216037ccab2",
            messagingSenderId: "297809629495",
            projectId: "shopyo-9e378",
          ),
        ).whenComplete(() {
          FirebaseCloudMessaging.instance.init();
          LocalNotificationService.init();
        })
      : await Firebase.initializeApp().whenComplete(() {
          FirebaseCloudMessaging.instance.init();
          LocalNotificationService.init();
        });
  await SharedPref().instantiatePreferences();
  await setupInjector();
  await HiveDatabase().setup();
  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const ShopyoStoreApp());
  });
}
