// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Localization`
  String get name {
    return Intl.message(
      'Flutter Localization',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Favourite`
  String get favourite {
    return Intl.message('Favourite', name: 'favourite', desc: '', args: []);
  }

  /// `Edit Account`
  String get editAccount {
    return Intl.message(
      'Edit Account',
      name: 'editAccount',
      desc: '',
      args: [],
    );
  }

  /// `Settings and Privacy`
  String get settingsandPrivacy {
    return Intl.message(
      'Settings and Privacy',
      name: 'settingsandPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `LanguageSetting`
  String get language {
    return Intl.message(
      'LanguageSetting',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Messages`
  String get message {
    return Intl.message('Messages', name: 'message', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Courses`
  String get course {
    return Intl.message('Courses', name: 'course', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Numerous free\n trial courses`
  String get numerousfreetrialcourses {
    return Intl.message(
      'Numerous free\n trial courses',
      name: 'numerousfreetrialcourses',
      desc: '',
      args: [],
    );
  }

  /// `Free courses for you to\n find your way to learning`
  String get freecourses {
    return Intl.message(
      'Free courses for you to\n find your way to learning',
      name: 'freecourses',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Quick and easy\n learning`
  String get quickandeasylearning {
    return Intl.message(
      'Quick and easy\n learning',
      name: 'quickandeasylearning',
      desc: '',
      args: [],
    );
  }

  /// `Easy and fast learning at\n any time to help you\n improve various skills`
  String get easyandfastlearning {
    return Intl.message(
      'Easy and fast learning at\n any time to help you\n improve various skills',
      name: 'easyandfastlearning',
      desc: '',
      args: [],
    );
  }

  /// `Create your own \nstudy plan`
  String get createyourownstudyplan {
    return Intl.message(
      'Create your own \nstudy plan',
      name: 'createyourownstudyplan',
      desc: '',
      args: [],
    );
  }

  /// `Study according to the\n study plan, make study\n more motivated`
  String get studyaccordingtothestudyplan {
    return Intl.message(
      'Study according to the\n study plan, make study\n more motivated',
      name: 'studyaccordingtothestudyplan',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get sign_in {
    return Intl.message('Login', name: 'sign_in', desc: '', args: []);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Enter your details below & free sign up`
  String get enteryourdetailsbelowfreesignup {
    return Intl.message(
      'Enter your details below & free sign up',
      name: 'enteryourdetailsbelowfreesignup',
      desc: '',
      args: [],
    );
  }

  /// `Your  Email`
  String get yourEmail {
    return Intl.message('Your  Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Creat account`
  String get creataccount {
    return Intl.message(
      'Creat account',
      name: 'creataccount',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account you have to agreewith our them & condication.`
  String get bycreatinganaccountyouhavetoagreewithourthemcondication {
    return Intl.message(
      'By creating an account you have to agreewith our them & condication.',
      name: 'bycreatinganaccountyouhavetoagreewithourthemcondication',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account？`
  String get alreadyhaveanaccount {
    return Intl.message(
      'Already have an account？',
      name: 'alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? Sign up`
  String get donthaveanaccountSignup {
    return Intl.message(
      'Don’t have an account? Sign up',
      name: 'donthaveanaccountSignup',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetpassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get orloginwith {
    return Intl.message(
      'Or login with',
      name: 'orloginwith',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Phone`
  String get continuewithPhone {
    return Intl.message(
      'Continue with Phone',
      name: 'continuewithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message('Continue', name: 'continues', desc: '', args: []);
  }

  /// `Verify Phone`
  String get verifyPhone {
    return Intl.message(
      'Verify Phone',
      name: 'verifyPhone',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t recieve code? Request again`
  String get didntrecievecodeRequestagain {
    return Intl.message(
      'Didn’t recieve code? Request again',
      name: 'didntrecievecodeRequestagain',
      desc: '',
      args: [],
    );
  }

  /// `Verify and Create Account`
  String get verifyandCreateAccount {
    return Intl.message(
      'Verify and Create Account',
      name: 'verifyandCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Congratulations, you have completed your registration!`
  String get youhavecompletedyourregistration {
    return Intl.message(
      'Congratulations, you have completed your registration!',
      name: 'youhavecompletedyourregistration',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Hi, Kristin`
  String get hiKristin {
    return Intl.message('Hi, Kristin', name: 'hiKristin', desc: '', args: []);
  }

  /// `Let’s start learning`
  String get letsstartlearning {
    return Intl.message(
      'Let’s start learning',
      name: 'letsstartlearning',
      desc: '',
      args: [],
    );
  }

  /// `Learned today`
  String get learnedtoday {
    return Intl.message(
      'Learned today',
      name: 'learnedtoday',
      desc: '',
      args: [],
    );
  }

  /// `My courses`
  String get mycourses {
    return Intl.message('My courses', name: 'mycourses', desc: '', args: []);
  }

  /// `46min`
  String get min {
    return Intl.message('46min', name: 'min', desc: '', args: []);
  }

  /// `What do youwant to learn today ?`
  String get whatdoyouwanttolearntoday {
    return Intl.message(
      'What do youwant to learn today ?',
      name: 'whatdoyouwanttolearntoday',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Learning Plan`
  String get learningPlan {
    return Intl.message(
      'Learning Plan',
      name: 'learningPlan',
      desc: '',
      args: [],
    );
  }

  /// `Packaging Design`
  String get packagingDesign {
    return Intl.message(
      'Packaging Design',
      name: 'packagingDesign',
      desc: '',
      args: [],
    );
  }

  /// `more`
  String get more {
    return Intl.message('more', name: 'more', desc: '', args: []);
  }

  /// `Meetup`
  String get meetup {
    return Intl.message('Meetup', name: 'meetup', desc: '', args: []);
  }

  /// `Off-line exchange of learning experiences`
  String get offlineexchangeoflearningexperiences {
    return Intl.message(
      'Off-line exchange of learning experiences',
      name: 'offlineexchangeoflearningexperiences',
      desc: '',
      args: [],
    );
  }

  /// `Find Cousre`
  String get findCousre {
    return Intl.message('Find Cousre', name: 'findCousre', desc: '', args: []);
  }

  /// `Painting`
  String get painting {
    return Intl.message('Painting', name: 'painting', desc: '', args: []);
  }

  /// `Choice your course`
  String get choiceyourcourse {
    return Intl.message(
      'Choice your course',
      name: 'choiceyourcourse',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Poular`
  String get poular {
    return Intl.message('Poular', name: 'poular', desc: '', args: []);
  }

  /// `New`
  String get New {
    return Intl.message('New', name: 'New', desc: '', args: []);
  }

  /// `Product Design v1.0`
  String get productDesignv10 {
    return Intl.message(
      'Product Design v1.0',
      name: 'productDesignv10',
      desc: '',
      args: [],
    );
  }

  /// `Robertson Connie`
  String get robertsonConnie {
    return Intl.message(
      'Robertson Connie',
      name: 'robertsonConnie',
      desc: '',
      args: [],
    );
  }

  /// `16 hours`
  String get hours {
    return Intl.message('16 hours', name: 'hours', desc: '', args: []);
  }

  /// `Java Development`
  String get javaDevelopment {
    return Intl.message(
      'Java Development',
      name: 'javaDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Nguyen Shane`
  String get nguyenShane {
    return Intl.message(
      'Nguyen Shane',
      name: 'nguyenShane',
      desc: '',
      args: [],
    );
  }

  /// `Visual Design`
  String get visualDesign {
    return Intl.message(
      'Visual Design',
      name: 'visualDesign',
      desc: '',
      args: [],
    );
  }

  /// `Bert Pullman`
  String get bertPullman {
    return Intl.message(
      'Bert Pullman',
      name: 'bertPullman',
      desc: '',
      args: [],
    );
  }

  /// `Search Filter`
  String get searchFilter {
    return Intl.message(
      'Search Filter',
      name: 'searchFilter',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Coding`
  String get coding {
    return Intl.message('Coding', name: 'coding', desc: '', args: []);
  }

  /// `Music`
  String get music {
    return Intl.message('Music', name: 'music', desc: '', args: []);
  }

  /// `Visual identiy`
  String get visualidentiy {
    return Intl.message(
      'Visual identiy',
      name: 'visualidentiy',
      desc: '',
      args: [],
    );
  }

  /// `Mathmatics`
  String get mathmatics {
    return Intl.message('Mathmatics', name: 'mathmatics', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `8-14 Hours`
  String get Hours8to14 {
    return Intl.message('8-14 Hours', name: 'Hours8to14', desc: '', args: []);
  }

  /// `14 hours`
  String get hours14 {
    return Intl.message('14 hours', name: 'hours14', desc: '', args: []);
  }

  /// `3-8 Hours`
  String get Hours3to8 {
    return Intl.message('3-8 Hours', name: 'Hours3to8', desc: '', args: []);
  }

  /// `14-20 Hours`
  String get Hours14to20 {
    return Intl.message('14-20 Hours', name: 'Hours14to20', desc: '', args: []);
  }

  /// `20-24 Hours`
  String get Hours20to24 {
    return Intl.message('20-24 Hours', name: 'Hours20to24', desc: '', args: []);
  }

  /// `24-30 Hours`
  String get Hours24to30 {
    return Intl.message('24-30 Hours', name: 'Hours24to30', desc: '', args: []);
  }

  /// `46min`
  String get min46 {
    return Intl.message('46min', name: 'min46', desc: '', args: []);
  }

  /// `60min`
  String get min60 {
    return Intl.message('60min', name: 'min60', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Product Design`
  String get productDesign {
    return Intl.message(
      'Product Design',
      name: 'productDesign',
      desc: '',
      args: [],
    );
  }

  /// `Webb Landon`
  String get webbLandon {
    return Intl.message('Webb Landon', name: 'webbLandon', desc: '', args: []);
  }

  /// `Webb Kyle`
  String get webbKyle {
    return Intl.message('Webb Kyle', name: 'webbKyle', desc: '', args: []);
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `6h 14min · 24 Lessons`
  String get Lessons {
    return Intl.message(
      '6h 14min · 24 Lessons',
      name: 'Lessons',
      desc: '',
      args: [],
    );
  }

  /// `About this course`
  String get aboutthiscourse {
    return Intl.message(
      'About this course',
      name: 'aboutthiscourse',
      desc: '',
      args: [],
    );
  }

  /// `Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,`
  String
  get sedutperspiciatisundeomnisistenatuserrorsitvoluptatemaccusantiumdoloremquelaudantium {
    return Intl.message(
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,',
      name:
          'sedutperspiciatisundeomnisistenatuserrorsitvoluptatemaccusantiumdoloremquelaudantium',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Course`
  String get welcometotheCourse {
    return Intl.message(
      'Welcome to the Course',
      name: 'welcometotheCourse',
      desc: '',
      args: [],
    );
  }

  /// `processoverview`
  String get processoverview {
    return Intl.message(
      'processoverview',
      name: 'processoverview',
      desc: '',
      args: [],
    );
  }

  /// `Discovery`
  String get discovery {
    return Intl.message('Discovery', name: 'discovery', desc: '', args: []);
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message('Buy Now', name: 'buyNow', desc: '', args: []);
  }

  /// `Balance`
  String get balance {
    return Intl.message('Balance', name: 'balance', desc: '', args: []);
  }

  /// `My card`
  String get mycard {
    return Intl.message('My card', name: 'mycard', desc: '', args: []);
  }

  /// `Pay Now`
  String get payNow {
    return Intl.message('Pay Now', name: 'payNow', desc: '', args: []);
  }

  /// `Payment Password`
  String get paymentPassword {
    return Intl.message(
      'Payment Password',
      name: 'paymentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the payment password`
  String get pleaseenterthepaymentpassword {
    return Intl.message(
      'Please enter the payment password',
      name: 'pleaseenterthepaymentpassword',
      desc: '',
      args: [],
    );
  }

  /// `Successful purchase!`
  String get successfulpurchase {
    return Intl.message(
      'Successful purchase!',
      name: 'successfulpurchase',
      desc: '',
      args: [],
    );
  }

  /// `Start learning`
  String get startlearning {
    return Intl.message(
      'Start learning',
      name: 'startlearning',
      desc: '',
      args: [],
    );
  }

  /// `Clocking in!`
  String get clockingin {
    return Intl.message('Clocking in!', name: 'clockingin', desc: '', args: []);
  }

  /// `GOOD JOB!`
  String get GOODJOB {
    return Intl.message('GOOD JOB!', name: 'GOODJOB', desc: '', args: []);
  }

  /// `totally hours`
  String get totallyhours {
    return Intl.message(
      'totally hours',
      name: 'totallyhours',
      desc: '',
      args: [],
    );
  }

  /// `hrs`
  String get hrs {
    return Intl.message('hrs', name: 'hrs', desc: '', args: []);
  }

  /// `Totally days`
  String get totallydays {
    return Intl.message(
      'Totally days',
      name: 'totallydays',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message('days', name: 'days', desc: '', args: []);
  }

  /// `Record of this week`
  String get Recordofthisweek {
    return Intl.message(
      'Record of this week',
      name: 'Recordofthisweek',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Completed`
  String get Completed {
    return Intl.message('Completed', name: 'Completed', desc: '', args: []);
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `notification`
  String get notification {
    return Intl.message(
      'notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Daniel Lawson`
  String get danielLawson {
    return Intl.message(
      'Daniel Lawson',
      name: 'danielLawson',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get Online {
    return Intl.message('Online', name: 'Online', desc: '', args: []);
  }

  /// `Congratulations on completing the first lesson, keep up the good work!`
  String get congratulationskeepupthegoodwork {
    return Intl.message(
      'Congratulations on completing the first lesson, keep up the good work!',
      name: 'congratulationskeepupthegoodwork',
      desc: '',
      args: [],
    );
  }

  /// `Your course has been updated, you can check the new course in your study course.`
  String get yourcoursehasbeenupdatedcheckthenewcourse {
    return Intl.message(
      'Your course has been updated, you can check the new course in your study course.',
      name: 'yourcoursehasbeenupdatedcheckthenewcourse',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message('Offline', name: 'offline', desc: '', args: []);
  }

  /// `Congratulations, you have completed your registration! Lets start your learning journey next.`
  String get congratulationsstartyourlearningjourneynext {
    return Intl.message(
      'Congratulations, you have completed your registration! Lets start your learning journey next.',
      name: 'congratulationsstartyourlearningjourneynext',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get justnow {
    return Intl.message('Just now', name: 'justnow', desc: '', args: []);
  }

  /// `Congratulations on completing the ...`
  String get congratulationsoncompletingthe {
    return Intl.message(
      'Congratulations on completing the ...',
      name: 'congratulationsoncompletingthe',
      desc: '',
      args: [],
    );
  }

  /// `Your course has been updated, you ...`
  String get yourcoursehasbeenupdatedyou {
    return Intl.message(
      'Your course has been updated, you ...',
      name: 'yourcoursehasbeenupdatedyou',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, you have ...`
  String get congratulationsyouhave {
    return Intl.message(
      'Congratulations, you have ...',
      name: 'congratulationsyouhave',
      desc: '',
      args: [],
    );
  }

  /// `No Notifictations yet!`
  String get noNotifictationsyet {
    return Intl.message(
      'No Notifictations yet!',
      name: 'noNotifictationsyet',
      desc: '',
      args: [],
    );
  }

  /// `We’ll notify you once we have something for you`
  String get Wellnotifyyouoncewehavesomethingforyou {
    return Intl.message(
      'We’ll notify you once we have something for you',
      name: 'Wellnotifyyouoncewehavesomethingforyou',
      desc: '',
      args: [],
    );
  }

  /// `No Network!`
  String get NoNetwork {
    return Intl.message('No Network!', name: 'NoNetwork', desc: '', args: []);
  }

  /// `Please check your internet connection and try again`
  String get checkyourinternetconnection {
    return Intl.message(
      'Please check your internet connection and try again',
      name: 'checkyourinternetconnection',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryagain {
    return Intl.message('Try again', name: 'tryagain', desc: '', args: []);
  }

  /// `No videos!`
  String get Novideos {
    return Intl.message('No videos!', name: 'Novideos', desc: '', args: []);
  }

  /// `Here is no video you want at the moment`
  String get novideo {
    return Intl.message(
      'Here is no video you want at the moment',
      name: 'novideo',
      desc: '',
      args: [],
    );
  }

  /// `Search more`
  String get searchmore {
    return Intl.message('Search more', name: 'searchmore', desc: '', args: []);
  }

  /// `No products`
  String get noproducts {
    return Intl.message('No products', name: 'noproducts', desc: '', args: []);
  }

  /// `You dont have any products yet!`
  String get donthaveanyproducts {
    return Intl.message(
      'You dont have any products yet!',
      name: 'donthaveanyproducts',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
