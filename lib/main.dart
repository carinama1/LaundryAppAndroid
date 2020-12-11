import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/Home/home_screen.dart';
import 'package:laundryapp/Screens/Welcome/welcome_screen.dart';
import 'package:laundryapp/constants.dart';
import 'package:flutter_session/flutter_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var session = FlutterSession();
  dynamic token = await session.get("token");
  print("token");
  print(token);
  if (token != '') {
    runApp(MyApp(
      isLogin: true,
    ));
  } else {
    runApp(MyApp(
      isLogin: false,
    ));
  }
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({Key key, this.isLogin: false}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: isLogin ? HomeScreen() : WelcomeScreen(),
    );
  }
}
