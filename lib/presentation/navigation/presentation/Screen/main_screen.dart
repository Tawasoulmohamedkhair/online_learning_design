import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Account/account_screen.dart';
import 'package:online_learning_design/presentation/Course/presentation/screens/course_screen.dart';
import 'package:online_learning_design/presentation/Home/presentation/home_screen.dart';
import 'package:online_learning_design/presentation/Message/message_screen.dart';
import 'package:online_learning_design/presentation/Search/presentation/screens/search_filter_dialog.dart';
import 'package:online_learning_design/presentation/navigation/presentation/NavigationBlocScreen/navigation_main_screeen_bloc.dart';
import 'package:online_learning_design/presentation/navigation/presentation/componant/build_nav_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = const <Widget>[
      HomeScreen(),
      CourseScreen(),
      MessageScreen(),
      AccountScreen(),
    ];
    return BlocProvider(
      create: (_) => NavigationMainScreeenBloc(),
      child: BlocBuilder<NavigationMainScreeenBloc, NavigationMainScreeenState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(index: state.currentIndex, children: screens),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                showDialog(
                  fullscreenDialog: true,
                  context: context,
                  builder: (context) => SearchFilterScreen(),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/Ellipse.svg',
                    width: 56,
                    height: 56,
                  ),
                  SvgPicture.asset(
                    'assets/svg/search.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Row(
              children: [
                BuildNavItem(
                  svgAssetPath: 'assets/svg/home.svg',
                  label: S.of(context).home,
                  index: 0,
                  onTap:
                      () => context.read<NavigationMainScreeenBloc>().add(
                        const NavigationItemSelected(0),
                      ),
                  selected: state.currentIndex == 0,
                ),
                BuildNavItem(
                  svgAssetPath: 'assets/svg/course.svg',
                  label: S.of(context).course,
                  index: 1,
                  onTap:
                      () => context.read<NavigationMainScreeenBloc>().add(
                        const NavigationItemSelected(1),
                      ),
                  selected: state.currentIndex == 1,
                ),
                BuildNavItem(
                  svgAssetPath: 'assets/svg/message.svg',
                  label: S.of(context).message,
                  index: 2,
                  onTap:
                      () => context.read<NavigationMainScreeenBloc>().add(
                        const NavigationItemSelected(2),
                      ),
                  selected: state.currentIndex == 2,
                ),
                BuildNavItem(
                  svgAssetPath: 'assets/svg/user.svg',
                  label: S.of(context).account,
                  index: 3,
                  onTap:
                      () => context.read<NavigationMainScreeenBloc>().add(
                        const NavigationItemSelected(3),
                      ),
                  selected: state.currentIndex == 3,
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
