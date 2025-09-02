import 'package:flutter/material.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/course_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';

class FilteredCoursesScreen extends StatefulWidget {
  final List<CourseEntity> allCourses;
  final FilterEntity appliedFilter;

  const FilteredCoursesScreen({
    super.key,
    required this.allCourses,
    required this.appliedFilter,
  });

  @override
  State<FilteredCoursesScreen> createState() => _FilteredCoursesScreenState();
}

class _FilteredCoursesScreenState extends State<FilteredCoursesScreen> {
  String searchQuery = "";
  List<CourseEntity> displayedCourses = [];
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    displayedCourses = widget.allCourses;

    if (widget.appliedFilter.categories.isNotEmpty) {
      selectedCategory = widget.appliedFilter.categories.first;
      _applyLocalFilters();
    }
  }

  void _applyLocalFilters() {
    Iterable<CourseEntity> courses = widget.allCourses;

    if (selectedCategory != null) {
      courses = courses.where(
        (course) => course.category.toLowerCase().contains(
          selectedCategory!.toLowerCase(),
        ),
      );
    }

    if (searchQuery.isNotEmpty) {
      courses = courses.where(
        (course) =>
            course.title.toLowerCase().contains(searchQuery.toLowerCase()),
      );
    }

    setState(() {
      displayedCourses = courses.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFilterButtons(),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search courses...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery = value;
                    _applyLocalFilters();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child:
                displayedCourses.isEmpty
                    ? const Center(child: Text("No courses found"))
                    : ListView.builder(
                      itemCount: displayedCourses.length,
                      itemBuilder: (_, index) {
                        final course = displayedCourses[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey[300],
                            ),
                            title: Text(course.title),
                            subtitle: Text(course.instructor),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${course.price}",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                Text(
                                  course.duration,
                                  style: const TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterButtons() {
    final categories = widget.appliedFilter.categories;
    if (categories.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      children:
          categories.map((cat) {
            final isSelected = selectedCategory == cat;
            return ElevatedButton.icon(
              onPressed: () {
                selectedCategory = cat;
                _applyLocalFilters();
              },
              icon: const Icon(Icons.check_circle_outline, size: 16),
              label: Text(cat),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? Colors.blue.shade300 : Colors.blue.shade100,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
            );
          }).toList(),
    );
  }
}

// -------------------- MOCK DATA --------------------

Future<List<CourseEntity>> fetchFilteredCourses(FilterEntity filter) async {
  await Future.delayed(Duration(seconds: 1));

  final allCourses = [
    CourseEntity(
      title: "Product Design v1.0",
      instructor: "Robertson Connie",
      price: 190,
      duration: "6 hours",
      category: "Design",
    ),
    CourseEntity(
      title: "UX/UI Design",
      instructor: "Webb Landon",
      price: 250,
      duration: "14 hours",
      category: "Design",
    ),
    CourseEntity(
      title: "Product Design Fundamentals",
      instructor: "Webb Kyle",
      price: 250,
      duration: "14 hours",
      category: "Design",
    ),
    CourseEntity(
      title: "Coding Basics",
      instructor: "Alice Smith",
      price: 120,
      duration: "8 hours",
      category: "Coding",
    ),
    CourseEntity(
      title: "Music Theory",
      instructor: "John Doe",
      price: 150,
      duration: "10 hours",
      category: "Music",
    ),
    CourseEntity(
      title: "Mathematics Mastery",
      instructor: "Jane Doe",
      price: 180,
      duration: "12 hours",
      category: "Mathematics",
    ),
    CourseEntity(
      title: "Painting Essentials",
      instructor: "Emily Rose",
      price: 95,
      duration: "5 hours",
      category: "Painting",
    ),
  ];

  // Helper to extract hours from duration string
  int parseHours(String duration) {
    final match = RegExp(r'(\d+)').firstMatch(duration);
    return match != null ? int.parse(match.group(1)!) : 0;
  }

  // Parse duration range from filter
  int minDuration = 0;
  int maxDuration = 100;
  if (filter.duration.contains("–")) {
    final parts = filter.duration.split("–");
    minDuration = int.tryParse(parts[0].trim().split(" ")[0]) ?? 0;
    maxDuration = int.tryParse(parts[1].trim().split(" ")[0]) ?? 100;
  }

  return allCourses.where((course) {
    final matchesCategory =
        filter.categories.isEmpty ||
        filter.categories.any(
          (cat) => course.category.toLowerCase().contains(cat.toLowerCase()),
        );

    final matchesPrice =
        course.price >= filter.priceRange.start &&
        course.price <= filter.priceRange.end;

    final courseHours = parseHours(course.duration);
    final matchesDuration =
        filter.duration.isEmpty ||
        (courseHours >= minDuration && courseHours <= maxDuration);

    return matchesCategory && matchesPrice && matchesDuration;
  }).toList();
}
