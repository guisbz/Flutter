import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    nome: 'John',
  ));
}

class MyApp extends StatefulWidget {
  final String nome;

  const MyApp({super.key, required this.nome});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int salario = 0;
  late String log;

  @override
  void initState() {
    log = '${widget.nome} é pobre';
    super.initState();
  }

  void addSalary(int valor) {
    setState(() {
      this.salario = this.salario + valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print('Usuário clicou');
          addSalary(200);
          print('Salário alterado para: $salario');
          log = 'Salário alterado para: $salario';
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('O salário de ${widget.nome} é $salario',
                textDirection: TextDirection.ltr),
            const SizedBox(
              height: 24,
            ),
            Text(log, textDirection: TextDirection.ltr),
          ],
        ),
      ),
    );
  }
}
