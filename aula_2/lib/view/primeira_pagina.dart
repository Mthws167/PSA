import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/botao_generico.dart';

class PrimeiraPagina extends StatelessWidget {
  final Key? key;
  const PrimeiraPagina({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cpf = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Página'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(
                    label: Text("CPF"), hintText: 'Informe o CPF'),
                onChanged: (valorDigitado) => cpf = valorDigitado),
            BotaoGenerico(
              textoBotao: "Ok!",
              funcao: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return validarCpf(context, cpf.toString());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget validarCpf(BuildContext context, String cpf) {
    return AlertDialog(
      title: Text("CPF: " + cpf),
      content: Text(validar(cpf)),
    );
  }

  validar(String cpf) {
    if (cpf.length == 14) {
      var cpfCompleto = cpf;
      if (!cpfCompleto.contains('.')) return 'CPF deve possuir "."!';
      if (!cpfCompleto.contains('-')) return 'CPF deve possuir "-"!';
      if (cpfCompleto.length != 14) return 'CPF deve possuir 14 caracteres!';
      var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
      var primeiroDigito = int.parse(cpfSemMascara.substring(9, 10));
      var segundoDigito = int.parse(cpfSemMascara.substring(10, 11));
      var numerosIguais = true;
      var temp15 = int.parse(cpfCompleto.substring(13, 14));

      var cpfListaNumeros = cpfSemMascara
          .substring(0, 9)
          .split('')
          .map<int>((e) => int.parse(e))
          .toList();

      for (var i = 1; i < cpfListaNumeros.length; i++) {
        var elementoAnterior = cpfListaNumeros[i - 1];
        var elementoAtual = cpfListaNumeros[i];
        if (elementoAnterior != elementoAtual) {
          numerosIguais = false;
          break;
        }
      }

      if (numerosIguais) return "CPF deve possuir números diferentes";
      var peso = 10;
      var digitoCalculado = 0;
      for (var n in cpfListaNumeros) {
        digitoCalculado += peso * n;
        peso--;
      }
      digitoCalculado = 11 - (digitoCalculado % 11);
      if (digitoCalculado > 9) digitoCalculado = 0;
      if (primeiroDigito != digitoCalculado)
        return "Primeiro Digito incorreto!";

      cpfListaNumeros.add(digitoCalculado);
      peso = 11;
      digitoCalculado = 0;
      for (var n in cpfListaNumeros) {
        digitoCalculado += peso * n;
        peso--;
      }
      digitoCalculado = 11 - (digitoCalculado % 11);
      if (digitoCalculado > 10) digitoCalculado = 0;
      if (segundoDigito != digitoCalculado) return "Segundo Digito incorreto!";
      return 'CPF válido';
    }
  }
}
