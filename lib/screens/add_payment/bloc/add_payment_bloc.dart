import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_payment_event.dart';
part 'add_payment_state.dart';

class AddPaymentBloc extends Bloc<AddPaymentEvent, AddPaymentState> {
  AddPaymentBloc() : super(AddPaymentInitial()) {
    on<AddPaymentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
