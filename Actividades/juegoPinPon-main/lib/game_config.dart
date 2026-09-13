abstract class GameConfig {
  static const int ancho = 40;
  static const int alto = 20;
  static const int tamanoPaleta = 4;

  static const Map<String, Duration> dificultades = {
    'Fácil': Duration(milliseconds: 80),
    'Normal': Duration(milliseconds: 50),
    'Difícil': Duration(milliseconds: 30),
  };

  static Duration frameRate = Duration(milliseconds: 50);
}

enum GameMode { vsJugador, vsIA }

enum Dificultad { facil, normal, dificil }