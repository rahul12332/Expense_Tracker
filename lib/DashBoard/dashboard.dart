import 'package:expensetracker/DashBoard/add_expenses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:expensetracker/widget/AddExpense.dart';

import '../Models/expenseModel/expenseModel.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

void initState() {
    // TODO: implement initState
context.read<AddExpensesCubit>()..getExpenseList();
    super.initState();
  }
  Widget build(BuildContext context) {
    // Mock data for expenses


    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.lightBlueAccent.shade400,
      ),
      body: BlocBuilder<AddExpensesCubit, AddExpensesState>(
        builder: (context, state) {
          if (state is AddExpensesLoading) {
            return Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AddExpensesLoaded) {
            if (state.ExpenseList!.isEmpty) {

              return Center(child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddExpenseScreen()),
                  ).then((value){
                    if(value==true){
                      setState(() {
                        context.read<AddExpensesCubit>()..getExpenseList();
                      });
                    }
                  });
                },
                child: Text("Add Expenses"),
              ),);
            }
            else {
              List<Expense> expenses = [
                Expense('Food', double.parse(state.ExpenseList![0].food.toString())),
                Expense('Transportation', double.parse(state.ExpenseList![0].transportation.toString()),),
                Expense('Utilities', double.parse(state.ExpenseList![0].untitled.toString()),),
                Expense('Entertainment', double.parse(state.ExpenseList![0].entertainment.toString()), ),
              ];

              return               Column(
                children: [
                  _buildChart(expenses),
                  Expanded(
                    child: ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(expenses[index].title),
                          subtitle:
                          Text('\$${expenses[index].amount.toString()}'),
                        );
                      },
                    ),
                  ),
                ],
              );

            }
          }
          if (state is ExpensesErrorState) {
            Center(
              child: Text("Some things wrongs from server"),
            );
          }
          return Text("Some things wents wrong");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add expense screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpenseScreen()),
          ).then((value){
            if(value){
              setState(() {
                context.read<AddExpensesCubit>()..getExpenseList();
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildChart(List<Expense> expenses) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries>[
          ColumnSeries<Expense, String>(
            dataSource: expenses,
            xValueMapper: (Expense expense, _) => expense.title,
            yValueMapper: (Expense expense, _) => expense.amount,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
