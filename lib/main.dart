import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DashBoard/add_expenses_cubit.dart';
import 'DashBoard/dashboard.dart';

void main() async{
  runApp(ExpenseTrackerApp());

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
      ),
    );
  }
}




