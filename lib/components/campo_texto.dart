import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final String cpf;
  final ValueChanged<String>? funcao; 
  const CampoTexto({required this.texto, required this.cpf, required this.funcao, super.key});

  @override
  Widget build(BuildContext context) {
    String? cpf = this.cpf;
    return TextFormField(
            decoration: InputDecoration(
                label: Text(this.texto), hintText: 'Informe o CPF'),
            onChanged: this.funcao,
          );
  }
}