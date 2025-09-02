import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:online_learning_design/core/utils/network_info.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Course/data/DataSource/course_remote_data_source.dart';
import 'package:online_learning_design/presentation/Course/domin/UseCase/get_categories.dart';
import 'package:online_learning_design/presentation/Course/domin/UseCase/get_courses.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Home/data/datasources/home_remote_data_source.dart';
import 'package:online_learning_design/presentation/Home/data/repositories/home_repository_impl.dart';
import 'package:online_learning_design/presentation/Home/domin/usecases/get_home_data.dart';
import 'package:online_learning_design/presentation/Home/presentation/homebloc/home_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/presentation/screen/onboarding_screen.dart';
import 'package:online_learning_design/presentation/Search/presentation/SearchBloc/search_bloc_bloc.dart';
import 'package:online_learning_design/presentation/auth/presentation/authbloc/auth_bloc.dart';
import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';

import 'package:online_learning_design/presentation/phone_auth/data/datasources/remote_data_source.dart';
import 'package:online_learning_design/presentation/phone_auth/data/repositories/phone_auth_repository_impl.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/usecases/submit_phone_number.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/usecases/verify_otp.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';

import '../presentation/Course/data/Repository/course_repository_impl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (context) => AuthBloc(
                signUpUseCase: SignUpUseCase(
                  authRepository: AuthRepositoryImpl(),
                ),
                loginUseCase: LoginUseCase(
                  authRepository: AuthRepositoryImpl(),
                ),
              ),
        ),
        BlocProvider<LocalizationBloc>(create: (context) => LocalizationBloc()),
        BlocProvider<PhoneAuthBloc>(
          create:
              (context) => PhoneAuthBloc(
                submitPhoneNumber: SubmitPhoneNumber(
                  PhoneAuthRepositoryImpl(
                    remoteDataSource: PhoneAuthRemoteDataSourceImpl(),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.instance,
                    ),
                  ),
                ),
                verifyOtp: VerifyOtp(
                  PhoneAuthRepositoryImpl(
                    remoteDataSource: PhoneAuthRemoteDataSourceImpl(),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.instance,
                    ),
                  ),
                ),
              ),
        ),
        BlocProvider<HomeBloc>(
          create:
              (context) => HomeBloc(
                getHomeData: GetHomeData(
                  HomeRepositoryImpl(
                    remoteDataSource: HomeRemoteDataSourceImpl(),
                  ),
                ),
              ),
        ),
        BlocProvider<SearchFilterBloc>(create: (context) => SearchFilterBloc()),
        BlocProvider<CourseBloc>(
          create:
              (context) => CourseBloc(
                getCategories: GetCategories(
                  CourseRepositoryImpl(
                    remoteDataSource: CourseRemoteDataSourceImpl(Dio()),
                  ),
                ),
                getCourses: GetCourses(
                  CourseRepositoryImpl(
                    remoteDataSource: CourseRemoteDataSourceImpl(Dio()),
                  ),
                ),
              ),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Online Learning App',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: localeState.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: OnboardingScreen(),
          );
        },
      ),
    );
  }
}
