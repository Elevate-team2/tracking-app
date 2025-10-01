import 'package:injectable/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tracking_app/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
}
