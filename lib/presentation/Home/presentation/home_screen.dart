import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Home/presentation/homebloc/home_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Home/presentation/homebloc/home_bloc_state.dart';
import 'package:online_learning_design/presentation/Home/presentation/componante/header_screen.dart';
import 'package:online_learning_design/presentation/Home/presentation/componante/learned_today_card.dart';
import 'package:online_learning_design/presentation/Home/presentation/componante/learning_plan_list.dart';
import 'package:online_learning_design/presentation/Home/presentation/componante/learning_section_screen.dart';
import 'package:online_learning_design/presentation/Home/presentation/componante/meet_up_screen.dart';

import 'homebloc/home_bloc_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      HeaderScreen(user: state.user),
                      Positioned(
                        top: 100,
                        left: 0,
                        right: 0,
                        child: LearnedTodayCard(progress: state.progress), 
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  LearningSectionScreen(
                    courses: [
                      Course(
                        title: 'Flutter',
                        description: 'Flutter description',
                        svgAssetPath: 'assets/svg/Avatar.svg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LearningPlanList(learningPlans: state.learningPlans),
                  const SizedBox(height: 15),
                  MeetUpScreen(),
                  const SizedBox(height: 15),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
