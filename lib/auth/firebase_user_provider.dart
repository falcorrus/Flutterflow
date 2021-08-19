import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MywayeuFirebaseUser {
  MywayeuFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

MywayeuFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MywayeuFirebaseUser> mywayeuFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MywayeuFirebaseUser>(
        (user) => currentUser = MywayeuFirebaseUser(user));
