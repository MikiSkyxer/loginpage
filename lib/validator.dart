import 'dart:async';

mixin Validators {

  // Email Validator
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
        // todo: cuba tambah lain seperti ".com" dan apa2 validator
    if (email.contains("@")) {
      // If valid it will pass the StreamTransformer
      sink.add(email);
    } else {
      // If not, Display Error
      sink.addError("Email is Invalid");
    }
  }
  );

  // Password Validator
    var passwordValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length > 5) {
      // If valid it will pass the StreamTransformer
      sink.add(password);
    } else {
      // If not, Display Error
      sink.addError("Password is less than 6 characters");
    }
  }
  );

}
