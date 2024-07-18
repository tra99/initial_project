import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:initial/pages/sample_list.dart';
import 'package:initial/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'api_service/client/dio_http_client.dart';
import 'api_service/client/index.dart';
import 'manager/sample_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    BaseHttpClient.init();
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [

              Provider(create: (_) => SampleManager()),
            ],
            child: Builder(
              builder: (context)=> MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const WelcomePage(),
              ),
            ),
          );
        }
    );



  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SampleList()));
          }, icon: const Icon(Icons.add))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
