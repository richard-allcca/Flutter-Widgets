import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Varios Tarjetas',
    link: '/cards',
    icon: Icons.credit_card_outlined
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animate',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItem(
    title: 'UI Controls + tile',
    subTitle: 'Una serie de controles flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),
];
