import 'package:flutter/material.dart';

class ValidaCnpj extends StatefulWidget {
  @override
  _ValidadorCnpjState createState() => _ValidadorCnpjState();

}

class _ValidadorCnpjState extends State<ValidaCnpj> {
  final _cnpjController = TextEditingController();
  bool _cnpjValido = false;

  bool ValidarCNPJ(String cnpj) {
      cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

      if (cnpj.length != 14) return false;

      if (RegExp(r'^(\d)\1*$').hasMatch(cnpj)) return false;

      List<int> digitos = cnpj.split('').map((e) => int.parse(e)).toList();

      var primeiroDigito = digitos[12];
      var segundoDigito = digitos[13];

      int soma = 0;
      int peso = 2;
      for (int i = 11; i >= 0; i--) {
        soma += digitos[i] * peso;
        peso = peso == 9 ? 2 : peso + 1;
      }
      int verificadorPrimeiroDigito = (soma % 11) < 2 ? 0 : 11 - (soma % 11);

      soma = 0;
      peso = 2;
      for (int i = 12; i >= 0; i--) {
        soma += digitos[i] * peso;
        peso = peso == 9 ? 2 : peso + 1;
      }
      int verificadorSegundoDigito = (soma % 11) < 2 ? 0 : 11 - (soma % 11);

      return verificadorPrimeiroDigito == primeiroDigito &&
          verificadorSegundoDigito == segundoDigito;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validador de CNPJ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Insira o CNPJ:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                maxLength: 18,
                decoration: InputDecoration(
                  hintText: '00.000.000/0000-00',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _cnpjValido = ValidarCNPJ(_cnpjController.text);
                });
              },
              child: Text('Validar CNPJ'),
            ),
            SizedBox(height: 20),
            Text(
              _cnpjValido ? 'CNPJ válido!' : 'CNPJ inválido.',
              style: TextStyle(
                fontSize: 18,
                color: _cnpjValido ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
