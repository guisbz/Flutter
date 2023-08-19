import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = 'Número';

  double primeiroNumero = 0.0;
  String operacao = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;

          numero = numero.replaceAll(',', '.');
          numero = numero.replaceAll('Número', '0');

          if (numero.contains('.')) {
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case '+':
        operacao = '+';
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;
        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }

        String resultadoString = resultado.toString();
        //3.0
        // 3       .          0
        //parte1 = 3 e parte2 = 0

        List<String> resultadoPartes = resultadoString.split('.');
        print(resultadoPartes);

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          int.parse(resultadoPartes[0]);
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;
      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('calculadora'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(numero, style: const TextStyle(fontSize: 34)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('AC'),
                    child: const Text('AC', style: TextStyle(fontSize: 34))),
                const Text(''),
                const Text(''),
                GestureDetector(
                    onTap: () => calcular('<x'),
                    child: const Text('<x', style: TextStyle(fontSize: 40))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      calcular('7');
                    },
                    child: const Text('7', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('8'),
                    child: const Text('8', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('9'),
                    child: const Text('9', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('/'),
                    child: const Text('/', style: TextStyle(fontSize: 34))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('4'),
                    child: const Text('4', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('5'),
                    child: const Text('5', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('6'),
                    child: const Text('6', style: TextStyle(fontSize: 34))),
                const Text('x', style: TextStyle(fontSize: 34)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('1'),
                    child: const Text('1', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('2'),
                    child: const Text('2', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('3'),
                    child: const Text('3', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('-'),
                    child: const Text('-', style: TextStyle(fontSize: 34))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('0'),
                    child: const Text('0', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular(','),
                    child: const Text(',', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('='),
                    child: const Text('=', style: TextStyle(fontSize: 34))),
                GestureDetector(
                    onTap: () => calcular('+'),
                    child: const Text('+', style: TextStyle(fontSize: 34))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
