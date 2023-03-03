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
    String cnpj = '';

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
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    label: Text("CNPJ"), hintText: 'Informe o CNPJ'),
                onChanged: (valorDigitado) => cnpj = valorDigitado),
            BotaoGenerico(
              textoBotao: "Ok!",
              funcao: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return validarCnpj(context, cnpj.toString());
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
      content: Text(validarCpfs(cpf)),
    );
  }

  Widget validarCnpj(BuildContext context, String cnpj) {
    return AlertDialog(
      title: Text("CNPJ: " + cnpj),
      content: Text(validarCnpjs(cnpj)),
    );
  }

  validarCpfs(String cpf) {
    var cpfCompleto = cpf;
    if (!cpfCompleto.contains('.')) return 'CPF deve possuir "."!';
    if (!cpfCompleto.contains('-')) return 'CPF deve possuir "-"!';
    if (cpfCompleto.length != 14) return 'CPF deve possuir 14 caracteres!';
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var primeiroDigito = int.parse(cpfSemMascara.substring(9, 10));
    var segundoDigito = int.parse(cpfSemMascara.substring(10, 11));
    var numerosIguais = true;

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
    if (primeiroDigito != digitoCalculado) return "Primeiro Digito incorreto!";

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

  validarCnpjs(String cnpj) {
    var cnpjCompleto = cnpj;
    if (!cnpjCompleto.contains('.')) return 'CNPJ deve possuir "."!';
    if (!cnpjCompleto.contains('-')) return 'CNPJ deve possuir "-"!';
    if (!cnpjCompleto.contains('/')) return 'CNPJ deve possuir "/"!';
    if (cnpjCompleto.length != 18) return 'CPF deve possuir 18 caracteres!';
    var cnpjSemMascara = cnpjCompleto.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
    var primeiroDigito = int.parse(cnpjSemMascara.substring(12, 13));
    var segundoDigito = int.parse(cnpjSemMascara.substring(13, 14));
    var numerosIguais = true;

    var cpfListaNumeros = cnpjSemMascara
        .substring(0, 14)
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

    if (numerosIguais) return "CNPJ deve possuir números diferentes";
    var peso = 13;
    var digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 14 - (digitoCalculado % 14);
    if (digitoCalculado > 12) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) return "Primeiro Digito incorreto!";

    cpfListaNumeros.add(digitoCalculado);
    peso = 14;
    digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 14 - (digitoCalculado % 14);
    if (digitoCalculado > 13) digitoCalculado = 0;
    if (segundoDigito != digitoCalculado) return "Segundo Digito incorreto!";
    return 'CNPJ válido';
  }
}
