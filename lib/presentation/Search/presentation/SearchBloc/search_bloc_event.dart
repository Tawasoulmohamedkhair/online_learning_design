import 'package:flutter/material.dart';

abstract class SearchFilterEvent {}

class CategorySelected extends SearchFilterEvent {
  final String category;
  CategorySelected(this.category);
}

class PriceRangeChanged extends SearchFilterEvent {
  final RangeValues range;
  PriceRangeChanged(this.range);
}

class DurationSelected extends SearchFilterEvent {
  final String duration;
  DurationSelected(this.duration);
}

class ApplyFilter extends SearchFilterEvent {}

class ClearFilter extends SearchFilterEvent {}
