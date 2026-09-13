import 'dart:io';

void main() {
  print('=============================');
  print('   CALCULADORA EN DART');
  print('=============================');
  print('1. Suma (+)');
  print('2. Resta (-)');
  print('3. Multiplicacion (*)');
  print('4. Division (/)');
  print('0. Salir');
  print('=============================');

  while (true) {
    stdout.write('\nElige una operacion (0-4): ');
    String? opcion = stdin.readLineSync();

    if (opcion == '0') {
      print('Hasta luego!');
      break;
    }

    if (!['1', '2', '3', '4'].contains(opcion)) {
      print('Opcion no valida.');
      continue;
    }

    stdout.write('Ingresa el primer numero: ');
    double? num1 = double.tryParse(stdin.readLineSync() ?? '');

    stdout.write('Ingresa el segundo numero: ');
    double? num2 = double.tryParse(stdin.readLineSync() ?? '');

    if (num1 == null || num2 == null) {
      print('Numero no valido.');
      continue;
    }

    double resultado;

    switch (opcion) {
      case '1':
        resultado = num1 + num2;
        print('Resultado: $num1 + $num2 = $resultado');
        break;
      case '2':
        resultado = num1 - num2;
        print('Resultado: $num1 - $num2 = $resultado');
        break;
      case '3':
        resultado = num1 * num2;
        print('Resultado: $num1 * $num2 = $resultado');
        break;
      case '4':
        if (num2 == 0) {
          print('Error: No se puede dividir entre cero.');
        } else {
          resultado = num1 / num2;
          print('Resultado: $num1 / $num2 = $resultado');
        }
        break;
    }
  }
}
