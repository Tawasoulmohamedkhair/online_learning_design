import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchFilterState extends Equatable {
  final List<String> selectedCategories;
  final RangeValues priceRange;
  final String selectedDuration;

  const SearchFilterState({
    required this.selectedCategories,
    required this.priceRange,
    required this.selectedDuration,
  });

  SearchFilterState copyWith({
    List<String>? selectedCategories,
    RangeValues? priceRange,
    String? selectedDuration,
  }) {
    return SearchFilterState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      priceRange: priceRange ?? this.priceRange,
      selectedDuration: selectedDuration ?? this.selectedDuration,
    );
  }

  @override
  List<Object?> get props => [selectedCategories, priceRange, selectedDuration];

  @override
  String toString() {
    return 'SearchFilterState('
        'selectedCategories: $selectedCategories, '
        'priceRange: ${priceRange.start}-${priceRange.end}, '
        'selectedDuration: $selectedDuration'
        ')';
  }
}
