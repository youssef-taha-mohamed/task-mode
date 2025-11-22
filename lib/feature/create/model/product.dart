import 'package:flutter_application_1/core/style/app_colors.dart';

import '../../../core/resources/svg.dart';
import 'package:flutter/material.dart';

class InvoiceItem {
  final String id;
  final String title;
  final String price;
  final int quantity;
  final String imagePath;
  final bool isSelected;
  final bool hasAction;
  final bool isExpired;

  InvoiceItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imagePath,
    this.isSelected = false,
    this.hasAction = true,
    this.isExpired = false,
  });
}

class CategoryItem {
  final String iconPath;
  final String label;
  final Color color;
  final Color iconColor;

  CategoryItem({
    required this.iconPath,
    required this.label,
    required this.color,
    required this.iconColor,
  });
}

final List<InvoiceItem> invoiceItems = [
  InvoiceItem(
    id: '1',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: true,
    hasAction: true,
  ),
  InvoiceItem(
    id: '2',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: false,
    hasAction: true,
  ),
  InvoiceItem(
    id: '3',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: false,
    hasAction: false,
  ),
  InvoiceItem(
    id: '4',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: false,
    hasAction: true,
    isExpired: true,
  ),
  InvoiceItem(
    id: '5',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: false,
    hasAction: true,
  ),
  InvoiceItem(
    id: '6',
    title: 'طابعة موديل f6 582',
    price: '1.000.000 د.ع',
    quantity: 20,
    imagePath: SvgAssets.image,
    isSelected: false,
    hasAction: true,
    isExpired: false,
  ),
];

final List<CategoryItem> categories = [
  CategoryItem(
    iconPath: SvgAssets.all,
    label: 'الكل',
    color: Color.fromRGBO(140, 122, 230, 0.15),
    iconColor: Color.fromRGBO(140, 122, 230, 1),
  ),
  CategoryItem(
    iconPath: SvgAssets.ram,
    label: 'قاري باركود',
    color: Color.fromRGBO(255, 196, 18, 0.15),
    iconColor: Color.fromRGBO(255, 196, 18, 1),
  ),
  CategoryItem(
    iconPath: SvgAssets.mobile,
    label: 'موبايلات',
    color: Color.fromRGBO(30, 144, 255, 0.15),
    iconColor: Color.fromRGBO(59, 173, 252, 1),
  ),
  CategoryItem(
    iconPath: SvgAssets.printer,
    label: 'طابعات',
    color: Color.fromRGBO(163, 203, 55, 0.15),
    iconColor: Color.fromRGBO(163, 203, 55, 1),
  ),
  CategoryItem(
    iconPath: SvgAssets.monitor,
    label: 'الإلكترونيات',
    color: Color.fromRGBO(236, 76, 102, 0.15),
    iconColor: Color.fromRGBO(236, 76, 102, 1),
  ),
];
