// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    this.bulletPrimary = 12,
    this.bulletSecondary = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  secondaryColor;

              Provider.of<_SlideshowModel>(context).bulletPrimary =
                  bulletPrimary;
              Provider.of<_SlideshowModel>(context).bulletSecondary =
                  bulletSecondary;

              return _CreateStructureSlideshow(dotsUp: dotsUp, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateStructureSlideshow extends StatelessWidget {
  const _CreateStructureSlideshow({
    required this.dotsUp,
    required this.slides,
  });

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp) _Dots(slides.length),
        Expanded(
          child: _Slides(slides),
        ),
        if (!dotsUp) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (index) => _Dot(
                  index: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;

    final slideShowModel = Provider.of<_SlideshowModel>(context);
    double size = 0;
    Color color;

    if (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5) {
      size = slideShowModel.bulletPrimary;
      color = slideShowModel.primaryColor;
    } else {
      size = slideShowModel.bulletSecondary;
      color = slideShowModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // actualizar provider (instancia de la clase)
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;

  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.blueGrey;
  double _bulletPrimary = 12;
  double _bulletSecondary = 12;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;

    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color) {
    _secondaryColor = color;
  }

  double get bulletPrimary => _bulletPrimary;

  set bulletPrimary(double value) {
    _bulletPrimary = value;
  }

  double get bulletSecondary => _bulletSecondary;

  set bulletSecondary(double value) {
    _bulletSecondary = value;
  }
}
