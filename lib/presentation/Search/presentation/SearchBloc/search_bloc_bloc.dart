import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';
import 'package:online_learning_design/presentation/Search/presentation/SearchBloc/search_bloc_event.dart';
import 'package:online_learning_design/presentation/Search/presentation/SearchBloc/search_bloc_state.dart';
import 'package:online_learning_design/presentation/Search/presentation/screens/search_screen.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc()
    : super(
        SearchFilterState(
          selectedCategories: [],
          priceRange: RangeValues(90, 200),
          selectedDuration: '3–8 Hours',
        ),
      ) {
    on<CategorySelected>((event, emit) {
      final updated = List<String>.from(state.selectedCategories);
      updated.contains(event.category)
          ? updated.remove(event.category)
          : updated.add(event.category);
      emit(state.copyWith(selectedCategories: updated));
    });

    on<PriceRangeChanged>((event, emit) {
      emit(state.copyWith(priceRange: event.range));
    });

    on<DurationSelected>((event, emit) {
      emit(state.copyWith(selectedDuration: event.duration));
    });

    on<ClearFilter>((event, emit) {
      emit(
        SearchFilterState(
          selectedCategories: [],
          priceRange: RangeValues(90, 200),
          selectedDuration: '',
        ),
      );
    });

    on<ApplyFilter>((event, emit) async {
      final navigatorKey = GlobalKey<NavigatorState>();

      final filter = FilterEntity(
        categories: state.selectedCategories,
        priceRange: state.priceRange,
        duration: state.selectedDuration,
      );

      final filteredCourses = await fetchFilteredCourses(filter);
      log(state.toString());

      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder:
              (_) => FilteredCoursesScreen(
                allCourses: filteredCourses,
                appliedFilter: filter,
              ),
        ),
      );
    });
  }
}
