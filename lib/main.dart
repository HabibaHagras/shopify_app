import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_app/pages/master_page.dart';
import 'package:shopify_app/pages/login_page.dart';
import 'package:shopify_app/pages/splash_page.dart';
import 'package:shopify_app/providers/app_auth.provider.dart';
import 'package:shopify_app/providers/category.provider.dart';
import 'package:shopify_app/providers/home.provider.dart';
import 'package:shopify_app/services/prefrences.service.dart';
import 'package:shopify_app/utils/theme.utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'providers/productProvider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  var prefrenceInstance = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefrenceInstance);

  var result = GetIt.I.allReadySync();

  if (result == true) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prefrences set successfully');
  } else {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Error When Set prefrences');
  }

    runApp(MultiProvider(providers: [
    
    ChangeNotifierProvider(
      create: (_) => AppAuthProvider()),
      
    Provider(create: (_) => CategoryProvider()),
    Provider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider())
  ], child: const MyApp()));
}












class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopify Application',
      theme: ThemeUtils.themeData,
      home: SplashPage(),
    );
  }
}
