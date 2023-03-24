import 'package:aula_16_02/components/botao_generico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      content:  Text(validar(cpf)),
    );
  }

  validar(String cpf) {
    if (!cpf.contains('.')) {
      return 'CPF inválido';
    }
    if(!cpf.contains('-')){
      return 'CPF inválido';
    }

    if(cpf.length != 14){
      return 'CPF inválido';
    }

    var temp,
        temp2,
        temp3,
        temp4,
        temp5,
        temp6;
   
          temp = cpf.replaceAll('.', '').replaceAll('-', '');
          temp2 = temp.split('');

          temp3 = true;
          for (int c = 0; c < temp2.length - 1; c++) {
            if (temp2[c] == temp2[c + 1]) {
              temp3 = false;
            } else {
              temp3 = true;
              break;
            }
          }

          if (!temp3) {
            return 'CPF inválido';
          }

          temp6 = 10;
          temp5 = 0;
          for (var n in temp.substring(0, 9).split('').map(int.parse).toList()) {
            temp5 = temp6 * n + temp5;
            temp6--;
          }

          temp6 = 11 - (temp5 % 11);
          if (temp6 > 9) {
            temp6 = 0;
          } else {
            temp6 = temp6;
          }
          if (temp6 == int.parse(cpf.substring(12, 13))) {
            temp6 = 11;
            temp5 = 0;
            for (var n in temp.substring(0, 10).split('').map(int.parse).toList()) {
              temp5 = temp6 * n + temp5;
              temp6--;
            }
            temp6 = 11 - (temp5 % 11);
            if (temp6 > 9) {
              temp6 = 0;
            } else {
              temp6 = temp6;
            }
            if (temp6 != int.parse(cpf.substring(13, 14))) {
              return 'CPF inválido';
            } 
          } else {
            return 'CPF inválido';
          }

          return 'CPF válido';
      }
}
