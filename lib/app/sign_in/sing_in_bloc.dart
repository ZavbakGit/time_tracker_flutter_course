import 'dart:async';

class SingInBloc{
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingController =>_isLoadingController.stream;

  void dispose(){
    _isLoadingController.close();
  }

  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

}