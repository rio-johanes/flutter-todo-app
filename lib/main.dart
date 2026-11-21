import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pert6_firebase/firebase_options.dart';
import 'package:pert6_firebase/screens/auth_gate.dart';
import 'package:pert6_firebase/providers/auth_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            // Masih loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            // Firebase gagal init
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text(
                    'Firebase error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            // Firebase berhasil, lanjut ke AuthGate
            return const AuthGate();
          },
        ),
      ),
    );
  }
}
