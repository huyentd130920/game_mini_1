import 'dart:async';

class CoreStream<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  Stream<T>? get stream => _controller.stream;
  void notify(T dataStream) {
    if (!_controller.isClosed) {
      _controller.sink.add(dataStream);
    }
  }

  void closeStream() {
    _controller.close();
  }

}
