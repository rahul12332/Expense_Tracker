import 'package:expensetracker/DashBoard/add_expenses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseScreen extends StatelessWidget {
  TextEditingController _foodController = TextEditingController();
  TextEditingController _transportationController = TextEditingController();
  TextEditingController _untitledController = TextEditingController();
  TextEditingController _entertainmentController = TextEditingController();

  String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title: Text('Add Expense'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true); // Navigate back with a value, if needed
          },
        ),
    ),
      body: BlocConsumer<AddExpensesCubit, AddExpensesState>(
  listener: (context, state) {
    if(state is DataAddedSuccessfully){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your data is successfully added'),

          );
        },
      );
      // Close the dialog after 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
        }
    // TODO: implement listener
  },
  builder: (context, state) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(width: 1.5, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(5)
                  
              ),
              child: TextField(
                controller: _foodController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hintText: "food",
                  border: InputBorder.none, // Remove underline


                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(5)

              ),
              child: TextField(
                controller: _transportationController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText: "Transport",

                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(5)

              ),
              child: TextField(
                controller: _untitledController,
                decoration: InputDecoration(
                    hintText: "untitled",
                  border: InputBorder.none

                ),
                keyboardType: TextInputType.number,
              ),
            ),

            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(5)

              ),
              child: TextField(
                controller: _entertainmentController,
                decoration: InputDecoration(
                    hintText: "Transport",
                  border: InputBorder.none
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                context.read<AddExpensesCubit>().AddExpense(
                  food: double.parse(_foodController.text),
                  transportation: double.parse(_transportationController.text),
                  entertainment: double.parse(_entertainmentController.text),
                  untitled: double.parse(_untitledController.text),
                );
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width*0.7,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade400,

                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Save')),
            ),
          ],
        ),
      );
  },
),
    );
  }
}
