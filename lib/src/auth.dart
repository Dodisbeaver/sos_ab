import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/login-service.dart';

class SosAbAuth extends ChangeNotifier {
  bool _signedIn = false;

  bool get signedIn => _signedIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in.
    var jwt = await attemptLogIn(username, password);
    print(jwt);

    if (jwt != null) {
      _signedIn = true;
      notifyListeners();
      return _signedIn;
    }
    return _signedIn;
  }

  @override
  bool operator ==(Object other) =>
      other is SosAbAuth && other._signedIn == _signedIn;

  @override
  int get hashCode => _signedIn.hashCode;
}

class SosAbAuthScope extends InheritedNotifier<SosAbAuth> {
  const SosAbAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static SosAbAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SosAbAuthScope>()!.notifier!;
}