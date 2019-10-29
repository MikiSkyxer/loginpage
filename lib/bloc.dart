import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

// *Input handler for email and password (using StreamController)
class Bloc extends Object with Validators implements BaseBloc {

// *This Allow to 'Listen' to input many times (not like "StreamController")
//  !'BehaviourSubject from RxDart Package
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // *StreamSync for Inputs
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

// *Stream and Getter for specific input, email and password to be transform.
Stream<String> get email => _emailController.stream.transform(emailValidator);
Stream<String> get password => _passwordController.stream.transform(passwordValidator);

// *Method check input for Email and Password
// !This method import function from rxDart package.
Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e,p) => true);

submit() { // !Submit Action
  print("Processing");
}

// *Dispose Memory Method
  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

// *Dispose Method
abstract class BaseBloc{
  void dispose();
}