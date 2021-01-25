import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sing_in_model.dart';
import 'package:time_tracker_flutter_course/app/sign_in/validators.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSingInChangeModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSingInChangeModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.formType = EmailSingInFormType.singIn,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;

  String email;
  String password;
  EmailSingInFormType formType;
  bool isLoading;
  bool submitted;

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      //await Future.delayed(Duration(seconds: 3));
      if (formType == EmailSingInFormType.singIn) {
        await auth.signInWithEmailAndPassword(email, password);
      } else {
        await auth.createUserWithEmailAndPassword(email, password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

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

  void toggleFormType() {
    final formType = this.formType == EmailSingInFormType.singIn
        ? EmailSingInFormType.register
        : EmailSingInFormType.singIn;

    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

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
