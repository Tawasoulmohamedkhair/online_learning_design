import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';
import 'package:online_learning_design/presentation/Search/presentation/SearchBloc/search_bloc_event.dart';
import 'package:online_learning_design/presentation/Search/presentation/screens/search_screen.dart';
import '../SearchBloc/search_bloc_bloc.dart';
import '../SearchBloc/search_bloc_state.dart';

class SearchFilterScreen extends StatelessWidget {
  SearchFilterScreen({super.key});

  final List<String> categories = [
    'Design',
    'Painting',
    'Coding',
    'Music',
    'Visual Identity',
    'Mathematics',
  ];

  final List<String> durations = [
    '3–8 Hours',
    '8–14 Hours',
    '14–20 Hours',
    '20–24 Hours',
    '24–30 Hours',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F39).withAlpha(230),
      body: BlocBuilder<SearchFilterBloc, SearchFilterState>(
        builder: (context, state) {
          final bloc = context.read<SearchFilterBloc>();
          return Column(
            children: [
              Spacer(),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text(S.of(context).searchFilter),
                          ],
                        ),
                        Text(
                          S.of(context).categories,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8,
                          children:
                              categories.map((cat) {
                                final selected = state.selectedCategories
                                    .contains(cat);
                                return ChoiceChip(
                                  label: Text(cat),
                                  selected: selected,
                                  onSelected:
                                      (_) => bloc.add(CategorySelected(cat)),
                                );
                              }).toList(),
                        ),
                        Text(
                          S.of(context).price,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        RangeSlider(
                          values: state.priceRange,
                          min: 50,
                          max: 300,
                          divisions: 10,
                          labels: RangeLabels(
                            "\$${state.priceRange.start.round()}",
                            "\$${state.priceRange.end.round()}",
                          ),
                          onChanged:
                              (range) => bloc.add(PriceRangeChanged(range)),
                        ),
                        Text(
                          S.of(context).duration,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8,
                          children:
                              durations.map((dur) {
                                return ChoiceChip(
                                  label: Text(dur),
                                  selected: state.selectedDuration == dur,
                                  onSelected:
                                      (_) => bloc.add(DurationSelected(dur)),
                                );
                              }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () => bloc.add(ClearFilter()),
                              child: Text(S.of(context).clear),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final bloc = context.read<SearchFilterBloc>();
                                bloc.add(ApplyFilter());

                                final currentState = bloc.state;
                                final filteredCourses =
                                    await fetchFilteredCourses(
                                      FilterEntity(
                                        categories:
                                            currentState.selectedCategories,
                                        priceRange: currentState.priceRange,
                                        duration: currentState.selectedDuration,
                                      ),
                                    );

                                final matchedCourses =
                                    filteredCourses.where((course) {
                                      final matchCategory =
                                          currentState
                                              .selectedCategories
                                              .isEmpty ||
                                          currentState.selectedCategories
                                              .contains(course.category);

                                      final matchPrice =
                                          course.price >=
                                              currentState.priceRange.start &&
                                          course.price <=
                                              currentState.priceRange.end;

                                      final courseHours =
                                          int.tryParse(
                                            course.duration.split(" ")[0],
                                          ) ??
                                          0;
                                      final durationParts = currentState
                                          .selectedDuration
                                          .split("–");
                                      int minHours =
                                          int.tryParse(
                                            durationParts[1].trim(),
                                          ) ??
                                          100;

                                      // الجديد: أي كورس أقل من الحد الأعلى يظهر
                                      final matchDuration =
                                          courseHours <= minHours;

                                      return matchCategory &&
                                          matchPrice &&
                                          matchDuration;
                                    }).toList();

                                if (matchedCourses.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "لا توجد كورسات مطابقة للفلاتر المختارة.",
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => FilteredCoursesScreen(
                                            allCourses: matchedCourses,
                                            appliedFilter: FilterEntity(
                                              categories:
                                                  currentState
                                                      .selectedCategories,
                                              priceRange:
                                                  currentState.priceRange,
                                              duration:
                                                  currentState.selectedDuration,
                                            ),
                                          ),
                                    ),
                                  );
                                }
                              },
                              child: Text(S.of(context).applyFilter),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
