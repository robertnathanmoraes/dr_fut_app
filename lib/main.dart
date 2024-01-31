// ignore: depend_on_referenced_packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dr_fut_app/amplifyconfiguration.dart';
import 'package:dr_fut_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';


void main() {
    
  runApp(const MyApp());
  configureAmplify();

}

void configureAmplify() async {
  try {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    debugPrint('Erro ao configurar o Amplify: $e');
  }

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}