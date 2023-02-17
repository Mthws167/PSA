import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  final Key? key;
  const InitialPage({this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText('Título'),
      ),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: const Text('CPF'),
                hintText: 'Informe o CPF',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Resultado'),
                      content: Text('CPF correto'),
                    );
                  },
                );
              },
              child: const Text('ok'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appBarText(String title) {
  return Text(title);
}
