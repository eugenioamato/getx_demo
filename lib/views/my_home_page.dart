import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_home_page_controller.dart';
import './about_page.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyHomePageController controller = Get.put(MyHomePageController());
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => AboutPage());
                },
                child: Text('About GetX')),
            TextButton(
                onPressed: () {
                  Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.amberAccent);
                },
                child: Text('Show Snackbar')),
            TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'GetX Alert',
                    middleText: 'Click Okay to reset counter',
                    textConfirm: 'Okay',
                    confirmTextColor: Colors.amberAccent,
                    textCancel: 'Cancel',
                    onConfirm: resetCounter,
                  );
                },
                child: Text('Show AlertDialog'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void resetCounter() {
    controller.count.value = 0;
    Get.back();
  }
}
