import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SClubFirebaseUser {
  SClubFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SClubFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SClubFirebaseUser> sClubFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SClubFirebaseUser>((user) => currentUser = SClubFirebaseUser(user));
