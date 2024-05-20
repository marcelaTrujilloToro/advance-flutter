import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/challenge/cuadrado_animado_page.dart';
import 'package:disenos/src/pages/circular_graphics_page.dart';
import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/headers_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:disenos/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: const SlideshowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical,
    title: 'Emergencia',
    page: const EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Encabezados',
    page: const HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'Cuadro animado',
    page: const CuadradoAnimagoPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'Barra progreso',
    page: const CircularGraphicsPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
    page: const PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    title: 'Slivers',
    page: const SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({
    required this.icon,
    required this.title,
    required this.page,
  });
}
