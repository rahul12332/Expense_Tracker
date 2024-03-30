import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'DashBoard/add_expenses_cubit.dart';
import 'DashBoard/dashboard.dart';

void main() async{
  configLoading();
  runApp(ExpenseTrackerApp());

}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
  //..maskColor = Colors.blue.withOpacity(0.6)
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false
    ..dismissOnTap = false
    ..toastPosition = EasyLoadingToastPosition.center;
  //..customAnimation = CustomAnimation();
}
class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
    BlocProvider<AddExpensesCubit>(create: (context) => AddExpensesCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}




