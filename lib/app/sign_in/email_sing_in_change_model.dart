import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sing_in_model.dart';
import 'package:time_tracker_flutter_course/app/sign_in/validators.dart';

class EmailSingInChangeModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSingInChangeModel({
    this.email = '',
    this.password = '',
    this.formType = EmailSingInFormType.singIn,
    this.isLoading = false,
    this.submitted = false,
  });

  String email;
  String password;
  EmailSingInFormType formType;
  bool isLoading;
  bool submitted;

  String get primaryButtonText {
    return formType == EmailSingInFormType.singIn
        ? 'Sing in'
        : 'Create an account';
  }

  String get secondaryButtonText {
    return formType == EmailSingInFormType.singIn
        ? 'Need an account? Register?'
        : 'Have in account? Sing in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        emailValidator.isValid(password) &&
        !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  void updateWith({
    String email,
    String password,
    EmailSingInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }
}
