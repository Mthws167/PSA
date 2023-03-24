import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BotaoGenerico extends StatelessWidget {
  final VoidCallback funcao;
  final String textoBotao;
  const BotaoGenerico(
      {Key? key,
      required this.textoBotao,
      required this.funcao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: funcao, child: Text(textoBotao));
  }
}