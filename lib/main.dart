import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/splash_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


Future main() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isAndroid || Platform.isIOS) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
  // this step, it will use the sqlite version available on the system.
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 return ChangeNotifierProvider(
       create: (_) => CartProvider(),
       
     child: Builder(builder: (BuildContext context){
       return MaterialApp(
         title: 'Shopping Cart',
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
          home: const SplashScreen(),
       );
     }),

   );
  }
}