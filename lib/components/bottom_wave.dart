import 'package:flutter/material.dart';

class BottomWave extends StatelessWidget {
  const BottomWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
            clipper: FirstClip(),
            child: Opacity(
              opacity: .3,
              child: Container(
                width: size.width,
                height: size.height * .1,
                decoration: BoxDecoration(color: Colors.white),
              ),
            )),
        ClipPath(
            clipper: SecondClip(),
            child: Opacity(
              opacity: .3,
              child: Container(
                width: size.width,
                height: size.height * .1,
                decoration: BoxDecoration(color: Colors.white),
              ),
            )),
        // ClipPath(
        //     // clipper: FirstClip(),
        //     child: Container(
        //   width: size.width,
        //   height: size.height * .1,
        //   decoration: BoxDecoration(color: Colors.white),
        // )),
      ],
    );
  }
}

class FirstClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width * .3, -30);
    var firstEndPoint = Offset(size.width * .75, size.height - 20.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width * .08), size.height);
    var secondEndPoint = Offset(size.width, size.height - 15);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class SecondClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width * .47, size.height);

    var firstControlPoint = Offset(size.width * .75, -10);
    var firstEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width * .47, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
