import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:comic_world/user/view/slpash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://orxroxjmxdjxgdkzbgcp.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yeHJveGpteGRqeGdka3piZ2NwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM1NDE4OTksImV4cCI6MjA3OTExNzg5OX0.mphbRGnJuYY8NpzB0l7JvsStzaWldVyEG7P7gRoQ-Js",
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SlpashScreen(),
    );
  }
}

