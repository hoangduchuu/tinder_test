import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:m_tinder/data/repository/user_repo_impl.dart';
// import 'package:isar/isar.dart';
import 'package:m_tinder/route.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repository/local/db/table/user_table.dart';
import 'domain/user_repo.dart';
import 'main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeIsarConnect();
  // GlobalBindings().dependencies();
 await initDatabase();


  runApp(const MyApp());
}

Future<void> initDatabase() async {
  // await Get.putAsync<Isar>(() async {
  //   final dir = await getApplicationSupportDirectory();
  //   var isar = await Isar.open(
  //     schemas: [
  //       UserDTOSchema,
  //     ],
  //     directory: dir.path,
  //   );
  //   return isar;
  // }, permanent: true); // Y
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Routes.home,
      getPages: routes,
      initialBinding: MainBinding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    UserRepo _repo = UserRepositoryImpl();
    _repo.getUsers().then((value) {
      print("dataa ne :${value.toString()}");
    });
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
