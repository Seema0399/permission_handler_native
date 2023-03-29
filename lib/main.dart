import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Permission Handler'),
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
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  initState() {
    super.initState();
    // RequestPermission().addPermission([Permissions.readCalendar]);
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
            ElevatedButton(
              onPressed: () {
                RequestPermission().addPermission([
                  Permissions.readCalendar,
                ]);
              },
              child: const Text(
                'Get Camera Permission',
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     RequestPermission().addPermission([
            //       Permissions.readExternalStorage,
            //     ]);
            //   },
            //   child: const Text(
            //     'Get Storage Permission',
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     RequestPermission().addPermission([
            //       Permissions.readContacts,
            //     ]);
            //   },
            //   child: const Text(
            //     'Get Contacts Permission',
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     RequestPermission().addPermission([
            //       Permissions.accessFineLocation,
            //     ]);
            //   },
            //   child: const Text(
            //     'Get Location Permission',
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     RequestPermission().addPermission([
            //       Permissions.recordAudio,
            //     ]);
            //   },
            //   child: const Text(
            //     'Get Mic Permission',
            //   ),
            // ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
