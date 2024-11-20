import 'package:basic_of_provider_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("RiverPod Simplified")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(normalProvider)),
            ref.watch(messageProvider).when(data: (message) {
              return Text(message);
            }, error: ((error, StackTrace) {
              return const Text("error");
            }), loading: () {
              return const CircularProgressIndicator();
            })
          ],
        ),
      ),
    );
  }
}
