import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build!');

    final counter = useState(0);
    final isSwitch = useState(false);

    // この場合statefulwidgetのinitStateと同じ
    // 初回build時にのみ呼ばれる
    useEffect(() {
      print('effect');
      return;
    }, const []); // keyを指定しない場合は毎回呼ばれる

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Center(
              child: ListTile(
                trailing: Switch.adaptive(
                  value: isSwitch.value,
                  onChanged: (_) {
                    isSwitch.value = !isSwitch.value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
