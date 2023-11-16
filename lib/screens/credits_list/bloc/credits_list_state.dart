part of 'credits_list_bloc.dart';

@immutable
abstract class CreditsListState {}

class CreditsListInitial extends CreditsListState {}

class LoadedCreditsListState extends CreditsListState {
  final List<CreditModel> creditList;

  LoadedCreditsListState({required this.creditList});

}

