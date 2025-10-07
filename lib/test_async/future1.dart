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
  // FutureOr<T> Function() computation  <==> FutureOr<T> computation()
  Future(() => 1);
  return counter;
}

// 在 Dart 中,以下两种函数类型声明方式是完全相同的:
//
// 1. **`FutureOr<int> computation()`** - 传统的函数类型声明语法
// 2. **`FutureOr<int> Function() computation`** - 现代的函数类型声明语法
//
// 两者都表示:
// - 参数名为 `computation`
// - 类型是一个**无参数**的函数
// - 该函数返回 `FutureOr<int>` 类型
//
// 就像代码注释中说明的那样:
// ```dart
// // FutureOr<T> Function() computation  <==> FutureOr<T> computation()
// ```
//
// **推荐使用**: `FutureOr<int> Function() computation` 这种现代语法,因为它更清晰地表达了"这是一个 Function 类型的参数"。
void foo(FutureOr<int> computation()){

}

void foo1(FutureOr<int> Function() computation){

}




