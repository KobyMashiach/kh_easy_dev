part of kh_easy_dev;

class DrawerDesign extends CustomPainter {
  final bool isLTR;
  final Color color;

  DrawerDesign({required this.isLTR, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    double startPoint = size.height * 0.75;

    if (isLTR) {
      // LTR wave
      _drawWave(canvas, size, paint, path, color, startPoint, size.width, 0);
    } else {
      // RTL wave
      _drawWave(canvas, size, paint, path, color, startPoint, 0, size.width);
    }
  }

  void _drawWave(Canvas canvas, Size size, Paint paint, Path path, Color color,
      double startPoint, double moveX, double lineX) {
    double firstWaveSize = 0.9;
    double waveAngle = size.width * 0.5;
    // First wave
    paint.color = color;
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(waveAngle, size.height * firstWaveSize, lineX,
        size.height * firstWaveSize);
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);

    // Second wave with 0.7 opacity
    paint.color = color.withOpacity(0.7);
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(waveAngle, size.height * (firstWaveSize + 0.04),
        lineX, size.height * (firstWaveSize + 0.04));
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);

    // Third wave with 0.5 opacity
    paint.color = color.withOpacity(0.5);
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(waveAngle, size.height * (firstWaveSize + 0.06),
        lineX, size.height * (firstWaveSize + 0.06));
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
