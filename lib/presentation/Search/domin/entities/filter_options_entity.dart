import 'package:flutter/material.dart';

class FilterEntity {
  final List<String> categories;
  final RangeValues priceRange;
  final String duration;

  FilterEntity({
    required this.categories,
    required this.priceRange,
    required this.duration,
  });
}
