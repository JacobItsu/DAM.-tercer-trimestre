// menu.dart
import 'dart:io';
import 'game_config.dart';

class Menu {
  static void mostrarMenuPrincipal() {
    stdout.write('\x1B[2J\x1B[H');
    print('╔═══════════════════════════════════════════╗');
    print('║           P I N G   P O N G              ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  1. Jugar contra otro jugador            ║');
    print('║  2. Jugar contra IA                      ║');
    print('║  3. Salir                                ║');
    print('╚═══════════════════════════════════════════╝');
    stdout.write('\nSelecciona una opción (1-3): ');
  }

  static void mostrarMenuDificultad() {
    stdout.write('\x1B[2J\x1B[H');
    print('╔═══════════════════════════════════════════╗');
    print('║          SELECCIONA DIFICULTAD           ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  1. Fácil   (Velocidad lenta)            ║');
    print('║  2. Normal  (Velocidad media)            ║');
    print('║  3. Difícil (Velocidad rápida)           ║');
    print('╚═══════════════════════════════════════════╝');
    stdout.write('\nSelecciona una opción (1-3): ');
  }

  static GameMode seleccionarModo() {
    while (true) {
      mostrarMenuPrincipal();
      final input = stdin.readLineSync()?.trim();
      switch (input) {
        case '1':
          return GameMode.vsJugador;
        case '2':
          return GameMode.vsIA;
        case '3':
          exit(0);
        default:
          print('Opción inválida. Presiona Enter para continuar...');
          stdin.readLineSync();
      }
    }
  }

  static Dificultad seleccionarDificultad() {
    while (true) {
      mostrarMenuDificultad();
      final input = stdin.readLineSync()?.trim();
      switch (input) {
        case '1':
          return Dificultad.facil;
        case '2':
          return Dificultad.normal;
        case '3':
          return Dificultad.dificil;
        default:
          print('Opción inválida. Presiona Enter para continuar...');
          stdin.readLineSync();
      }
    }
  }

  static void configurarDificultad(Dificultad dificultad) {
    switch (dificultad) {
      case Dificultad.facil:
        GameConfig.frameRate = GameConfig.dificultades['Fácil']!;
        break;
      case Dificultad.normal:
        GameConfig.frameRate = GameConfig.dificultades['Normal']!;
        break;
      case Dificultad.dificil:
        GameConfig.frameRate = GameConfig.dificultades['Difícil']!;
        break;
    }
  }

  static void mostrarControles(GameMode modo) {
    stdout.write('\x1B[2J\x1B[H');
    print('╔═══════════════════════════════════════════╗');
    print('║              CONTROLES                   ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  Jugador 1:  W (arriba)  S (abajo)       ║');
    if (modo == GameMode.vsJugador) {
      print('║  Jugador 2:  I (arriba)  K (abajo)       ║');
    } else {
      print('║  Jugador 2:  Controlado por IA           ║');
    }
    print('║  Salir:      Q                           ║');
    print('╚═══════════════════════════════════════════╝');
    print('\nPresiona Enter para comenzar...');
    stdin.readLineSync();
  }
}