import 'package:counter_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bottom_nav_bar_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CounterProvider()),
        ChangeNotifierProvider(create: (_)=> BottomNav())
      ],
      // child:
      // ChangeNotifierProvider(
      //   create: (_)=> CounterProvider(),
        child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:  MyHomePage(title: 'Flutter Demo Home Page'),
            ),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});

  final String title;

  //int currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, child) {
                return Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: Provider.of<CounterProvider>(context).incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: Provider.of<CounterProvider>(context).decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
      bottomNavigationBar: Consumer<BottomNav>(
        builder: (context, provider, child ){
        return BottomNavigationBar(
          currentIndex: provider.currentIndex,
          // onTap: (index){
          //   // setState(() {
          //   //   currentIndex =index;
          //   //
          //   // });
          // },
          onTap: (index){
           provider.changeNavBar(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.account_box_sharp), label: "Profile",),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu",)
          ],
        );}));

  }
}
