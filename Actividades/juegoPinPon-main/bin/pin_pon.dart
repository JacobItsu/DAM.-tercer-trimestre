import 'package:pin_pon/entities.dart';
import 'package:pin_pon/game_config.dart';
import 'package:pin_pon/input.dart';
import 'package:pin_pon/menu.dart';
import 'package:pin_pon/pin_pon.dart';
import 'package:pin_pon/render.dart';

import 'dart:async';
import 'dart:io';

void main() {
  stdout.write('\x1B[2J\x1B[H');
  stdout.write(saludo());

  final modo = Menu.seleccionarModo();
  final dificultad = Menu.seleccionarDificultad();
  Menu.configurarDificultad(dificultad);
  Menu.mostrarControles(modo);

  stdout.write('\x1B[?25l');

  final pelota = Pelota(
    x: GameConfig.ancho ~/ 2,
    y: GameConfig.alto ~/ 2,
  );

  final j1 = Paleta(x: 2, y: 8, alto: GameConfig.tamanoPaleta);
  final j2 = Paleta(x: GameConfig.ancho - 3, y: 8, alto: GameConfig.tamanoPaleta);

  int puntajeJ1 = 0;
  int puntajeJ2 = 0;

  configurarTeclado((tecla) {
    if (tecla == 'w') j1.moverArriba();
    if (tecla == 's') j1.moverAbajo(GameConfig.alto);
    if (modo == GameMode.vsJugador) {
      if (tecla == 'i') j2.moverArriba();
      if (tecla == 'k') j2.moverAbajo(GameConfig.alto);
    }
    if (tecla == 'q') {
      restaurarTerminal();
      exit(0);
    }
  });

  Timer.periodic(GameConfig.frameRate, (timer) {
    pelota.mover();

    if (pelota.y <= 0 || pelota.y >= GameConfig.alto - 1) {
      pelota.rebotarY();
    }

    if (pelota.x == j1.x + 1 && (pelota.y >= j1.y && pelota.y < j1.y + j1.alto)) {
      pelota.rebotarX();
    }

    if (pelota.x == j2.x - 1 && (pelota.y >= j2.y && pelota.y < j2.y + j2.alto)) {
      pelota.rebotarX();
    }

    if (modo == GameMode.vsIA) {
      final velocidadIA = dificultad == Dificultad.dificil ? 2 : 1;
      j2.moverIA(pelota.y, GameConfig.alto, velocidad: velocidadIA);
    }

    if (pelota.x <= 0) {
      puntajeJ2++;
      pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
    } else if (pelota.x >= GameConfig.ancho - 1) {
      puntajeJ1++;
      pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
    }

    Renderer.dibujar(pelota, j1, j2, puntajeJ1, puntajeJ2);
  });

  ProcessSignal.sigint.watch().listen((_) {
    restaurarTerminal();
    exit(0);
  });
}

void restaurarTerminal() {
  stdout.write('\x1B[?25h');
  stdin.lineMode = true;
  stdin.echoMode = true;
}