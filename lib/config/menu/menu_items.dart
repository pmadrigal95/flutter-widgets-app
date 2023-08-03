import 'package:flutter/material.dart';

class MenuItem {
  final String title;

  final String subTitle;

  final String link;

  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios Botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),

  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
      
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),

  MenuItem(
      title: 'Snackbars y Dialog',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.add_to_home_screen),

  MenuItem(
    title: 'Animated Container',
    subTitle: 'Statefull widget animado',
    link: '/animated',
    icon: Icons.square_rounded),

  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.text_snippet_outlined),

  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.sports_esports_rounded),
];
