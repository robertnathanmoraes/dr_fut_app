import 'package:dr_fut_app/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;

  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 236, 255, 64),
              Colors.lightGreenAccent,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: 20, child: _buildTop()),
            Positioned(top: mediaSize.height * 0.50, left: 28, child: _buildTextH1()),
            Positioned(top: mediaSize.height * 0.88, left: 28, child: _buildLoginButton()),
            Positioned(top: mediaSize.height * 0.88, left: mediaSize.width * 0.52, child: _buildRegisterButton()),
            // Positioned(top: mediaSize.height * 0.7, left: 50, child: _buildGoogleButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );
  }

  Widget _buildTextH1() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SPORT CONNECT",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "CONECTANDO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "SUAS PARTIDAS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: Size(mediaSize.width * 0.4, 55),
        shadowColor: myColor,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: const Text("Entrar", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                CadastroScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: Size(mediaSize.width * 0.4, 55),
        shadowColor: myColor,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: const Text("Cadastrar-se", style: TextStyle(color: Colors.grey)),
    );
  }

}
