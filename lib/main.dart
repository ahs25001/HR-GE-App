import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:he_dg/config/routs/routs.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder
          : (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            onGenerateRoute: (settings) => Routes.onGenerate(settings),
          ),
    );
  }
}
