import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService.internal();

  static final AuthService _instance = 
    AuthService.internal();

  factory AuthService() {
    return _instance;
  }

  //mengakses firebase authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;  

  //memantau perubahan status login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //mendaftarkan akun
  Future<User?> signUp(
    String email,
    String Password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: Password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Error Sign up: $e");
      return null;
    }
  }

  //login menggunakan akun terdaftar
  Future<User?> signIn(
    String email,
    String Password,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: Password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Error Sign in: $e");
      return null;
    }
  }

  //logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}