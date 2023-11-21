part of 'credit_bloc.dart';

@immutable
abstract class CreditState {}

class CreditInitial extends CreditState {}

class LoadedCreditsListState extends CreditState {
  final List<CreditModel> creditList;

  LoadedCreditsListState({required this.creditList});
}
