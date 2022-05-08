import 'package:flutter/material.dart';

class TopCoinModel {
  String logo;
  String cryptnoName;
  String cryptoAmount;
  Color cryptoColor;
  double percentage;

  TopCoinModel(
      {required this.logo,
      required this.cryptnoName,
      required this.cryptoAmount,
      required this.cryptoColor,
      required this.percentage});
}
