import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sing_in_model.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSinInBloc {
  EmailSinInBloc({@required this.auth});

  final AuthBase auth;
  final StreamController<EmailSingInModel> _modelController =
      StreamController<EmailSingInModel>();

  Stream<EmailSingInModel> get modelStream => _modelController.stream;

  EmailSingInModel _model = EmailSingInModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      //await Future.delayed(Duration(seconds: 3));
      if (_model.formType == EmailSingInFormType.singIn) {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == EmailSingInFormType.singIn
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
    // update model
    _model = _model.copyWith(
      email: email,
      formType: formType,
      isLoading: isLoading,
      password: password,
      submitted: submitted,
    );
    _modelController.add(_model);
    // add updated model to _modelController
  }
}
