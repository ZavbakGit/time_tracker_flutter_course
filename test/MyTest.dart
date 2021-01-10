import 'dart:async';

void addLessThanFive(StreamController controller, int value) {
  if (value < 5) {
    controller.sink.add(value);
  } else {
    controller.sink.addError(StateError('$value is not less thn 5'));
  }
}

void main() {
  final controller = StreamController();
  controller.sink.add(10);
  controller.sink.add('Hi');

  controller.close();
  //
  // addLessThanFive(controller, 0);

  controller.stream.listen((event) {
    print(event);
  }, onError: (error) {
    print(error);
  }, onDone: (){
    print('Done');
  });
}
