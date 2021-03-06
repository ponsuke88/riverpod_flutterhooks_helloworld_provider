import 'package:flutter/material.dart';

// ポイント1
// pubspec.yamlの以下の場所に  flutter_hooks: ^0.15.0、
// hooks_riverpod: ^0.12.1を追記(インデント注意)
// dependencies:
//   flutter:
//     sdk: flutter
//   flutter_hooks: ^0.15.0
//   hooks_riverpod: ^0.12.1

// ポイント2
// main.dartに以下の2行を追加してパッケージを使えるようにする
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    // ポイント3
    // MyApp()をProviderScopeで包む
    ProviderScope(child: MyApp()),
  );
}

// ポイント4
// 引数を以下のようにしてProviderオブジェクトを
// 生成してhelloWorldProviderに入れる
final helloWorldProvider = Provider((ref) => 'Hello world');

// ポイント5
// HookWidgetを継承する
class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // ポイント6
    // useProviderを使ってhelloWorldProviderから
    // 'Hello world' を取得する
    // buildメソッドの中に書くこと
    final String value = useProvider(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello world'),
        ),
        body: Center(
          child: Text(value), // Hello world
        ),
      ),
    );
  }
}
