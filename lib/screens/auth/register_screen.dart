import 'package:dr_fut_app/services/cadastroForm.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CadastroScreen extends StatelessWidget {

  CadastroScreen({super.key});
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: CadastroForm(), // Crie a classe CadastroForm para o formulário
      ),
    );
  }
}
