import 'dart:async';

int _counter = 0;
///参考张老师的异步课程超nice，https://juejin.cn/post/7146043116074565669
void main() {
  for (int i = 0; i < 10; i++) {
    _doIncrementTask();
  }
}

void _doIncrementTask() async {
  // 模拟异步任务
  try {
    _counter = await Future.delayed(const Duration(seconds: 1), computation);
    print('Counter: $_counter');
  } catch (e) {
    print('Caught error: $e');
  }
}

/// FutureOr 可以返回 Future 或 直接返回值
FutureOr<int> computation(){
  int counter = _counter + 1;
  if (counter % 3 == 0) {
    throw 'error';
  }
  return counter;
}
