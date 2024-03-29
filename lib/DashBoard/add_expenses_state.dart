part of 'add_expenses_cubit.dart';

@immutable
abstract class AddExpensesState {}

class AddExpensesInitial extends AddExpensesState {}
class AddExpensesLoading extends AddExpensesState{}
class DataAddedSuccessfully extends AddExpensesState{}
class AddExpensesLoaded extends AddExpensesState {
  List<ExpenseModel>? ExpenseList;
  AddExpensesLoaded({required this.ExpenseList});

}
class ExpensesErrorState extends AddExpensesState{}

