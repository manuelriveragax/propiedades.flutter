part of 'widgets.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final String image;

  const Logo({
    this.width = 250.0,
    this.height = 190.0,
    this.image = 'assets/images/home_logo.png',
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      fit: BoxFit.fill,
      image: AssetImage(image),
    );
  }
}
