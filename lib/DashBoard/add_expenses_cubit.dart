import 'package:bloc/bloc.dart';
import 'package:expensetracker/Models/expenseModel/ExpenseModel/expenseModel.dart';
import 'package:meta/meta.dart';

import '../Models/expenseModel/expenseModel.dart';

part 'add_expenses_state.dart';

class AddExpensesCubit extends Cubit<AddExpensesState> {
  AddExpensesCubit() : super(AddExpensesInitial());

  List<ExpenseModel>? mainExpenseList = [];

  AddExpense({ double ? food,  double? transportation,  double ? untitled,  double ? entertainment}) async {
    await Future.delayed(Duration(seconds: 3));
    mainExpenseList!.clear();
    if(food!=0 && transportation != 0 && untitled != 0 && entertainment != 0){
      mainExpenseList!.add(ExpenseModel(food, transportation, untitled, entertainment));
      emit(DataAddedSuccessfully());
      for(var data in mainExpenseList!){
        print("Testing category name ${data.food}");
        print("Testing amount${data.transportation}");
        print("Testing title ${data.untitled}");

      }
    }
    else{ExpensesErrorState();
    }
}

getExpenseList() async {
  emit(AddExpensesLoading());

  await Future.delayed(Duration(seconds: 3));

    emit(AddExpensesLoaded(ExpenseList: mainExpenseList!));



}
}
