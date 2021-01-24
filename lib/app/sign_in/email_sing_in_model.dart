import 'package:time_tracker_flutter_course/app/sign_in/validators.dart';

enum EmailSingInFormType { singIn, register }

class EmailSingInModel with EmailAndPasswordValidators {
  EmailSingInModel({
    this.email = '',
    this.password = '',
    this.formType = EmailSingInFormType.singIn,
    this.isLoading = false,
    this.submitted = false,
  });

  final String email;
  final String password;
  final EmailSingInFormType formType;
  final bool isLoading;
  final bool submitted;

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

  EmailSingInModel copyWith({
    String email,
    String password,
    EmailSingInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSingInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}
