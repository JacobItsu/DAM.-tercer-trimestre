class Pelota {
  int x;
  int y;
  int dx; // Dirección horizontal: 1 (derecha) o -1 (izquierda)
  int dy; // Dirección vertical: 1 (abajo) o -1 (arriba)

  Pelota({required this.x, required this.y, this.dx = 1, this.dy = 1});

  void mover() {
    x += dx;
    y += dy;
  }

  void rebotarY() => dy = -dy;
  void rebotarX() => dx = -dx;

  void reiniciar(int centroX, int centroY) {
    x = centroX;
    y = centroY;
    dx = -dx; // Cambia de lado hacia quien anotó
  }
}

class Paleta {
  int y;
  final int x;
  final int alto;

  Paleta({required this.x, required this.y, required this.alto});

  void moverArriba() {
    if (y > 1) y--;
  }

  void moverAbajo(int limiteInferior) {
    if (y + alto < limiteInferior - 1) y++;
  }

  void moverIA(int pelotaY, int limiteInferior, {int velocidad = 1}) {
    final centroPaleta = y + (alto ~/ 2);
    if (centroPaleta < pelotaY - 1 && y + alto < limiteInferior - 1) {
      y += velocidad;
    } else if (centroPaleta > pelotaY + 1 && y > 1) {
      y -= velocidad;
    }
  }
}