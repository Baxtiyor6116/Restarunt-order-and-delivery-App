import 'package:firebase_auth/firebase_auth.dart';
import 'package:restarauntexamapp/firebase/for_firestore_service.dart';
import 'package:restarauntexamapp/login/users.dart';

class AuthServicesHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UsersUid firebasedanFoydalanuvchi(User? user) {
    return UsersUid(uid: user!.uid);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Xato Service signOUt funksiya : $e");
    }
  }

  Future signUpWithEmail(String email, String password, String phone) async {
    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = _credential.user!;

      await FirestoreService(uid: user.uid)
          .writeFirestore(email, phone, user.uid);

      return firebasedanFoydalanuvchi(user);
    } catch (e) {
      print("Service sign up function : $e");
    }
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = _credential.user!;

      return firebasedanFoydalanuvchi(user);
    } catch (e) {
      print("Service sign in function : $e");
    }
  }
}
