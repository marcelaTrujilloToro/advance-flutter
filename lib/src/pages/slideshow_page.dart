import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      const Expanded(child: MySlideShow()),
      const Expanded(child: MySlideShow()),
    ];

    return Scaffold(
      body: (isLarge) ? Column(children: children) : Row(children: children),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Slideshow(
      bulletPrimary: 20,
      bulletSecondary: 12,
      dotsUp: true,
      primaryColor:
          appTheme.darkTheme ? appTheme.currentTheme.primaryColor : Colors.pink,
      slides: [
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
      ],
    );
  }
}
