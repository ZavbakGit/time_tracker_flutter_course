import 'dart:async';

import 'package:rxdart/rxdart.dart';

void addLessThanFive(StreamController controller, int value) {
  if (value < 5) {
    controller.sink.add(value);
  } else {
    controller.sink.addError(StateError('$value is not less thn 5'));
  }
}


Future<void> mayTest() async{
  //var controller = new StreamController<String>();

  //StreamSubscription subscription = controller.stream.listen((item) => print(item));
  // var controller = new StreamController<String>();
  //
  // //var streamObservable = Observable(controller.stream);
  // controlle
  //
  // Observable.periodic(Duration(seconds: 1), (x) => x.toString() )



  // subscription.cancel;
  // print("finish");
}

void main() async{
  mayTest();
  await Future.delayed(Duration(milliseconds: 500));

  // final controller1 = StreamController();
  //
  // final controller2 = StreamController();
  //
  // final s=  Rx.combineLatest2(
  //   controller1.stream,
  //   controller2.stream,
  //       (a, b) => '$a $b',
  // );
  //
  // controller1.stream.listen((event) {
  //   print(event);
  // });
  //
  // controller1.add(100);
  // controller1.add(2);
  // controller1.add(3);
  // controller1.add(4);
  //
  //
  // controller2.sink.add('yes');
  // controller2.sink.add('Hi');

  //
  // addLessThanFive(controller, 0);

  //if(true) ...print('hi');





  // Future.delayed(const Duration(seconds: 3), () => "stop");
  //

  // controller.stream.listen((event) {
  //   print(event);
  // }, onError: (error) {
  //   print(error);
  // }, onDone: (){
  //   print('Done');
  // });
}
