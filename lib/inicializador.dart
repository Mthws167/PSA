import 'package:aula_16_02/view/pagina_professor.dart';
// import 'package:aula_16_02/view/primeira_pagina.dart';
import 'package:aula_16_02/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Inicializador extends StatelessWidget {
  const Inicializador({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PaginaProfessor(),
    );
  }
}