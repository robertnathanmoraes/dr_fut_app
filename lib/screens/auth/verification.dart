import 'package:flutter/material.dart';

// ignore: camel_case_types
class verificationCodeSignUp extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  verificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Código'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Digite o código de confirmação enviado para o seu e-mail:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Código de Confirmação',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para confirmar o código
                // Por exemplo: chamar um método para confirmar o código usando Amplify
                confirmCode(_codeController.text);
              },
              child: const Text('Confirmar Código'),
            ),
          ],
        ),
      ),
    );
  }

  // Exemplo de método para confirmar o código usando Amplify
  void confirmCode(String code) {
    // Lógica para confirmar o código aqui
    // Por exemplo, usando Amplify Auth
    // Amplify.Auth.confirmSignUp(username: 'usuário', confirmationCode: code);
  }
}

void main() {
  runApp(MaterialApp(
    home: verificationCodeSignUp(),
  ));
}
