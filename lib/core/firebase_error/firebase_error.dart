import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tracking_app/core/api_result/result.dart';

class FirebaseErrorHandler extends FailedResult {
  FirebaseErrorHandler(super.errorMessage);

  static FailedResult handle(Exception error) {
    if (error is FirebaseAuthException) {
      return FailedResult(_handleAuthError(error));
    } else if (error is FirebaseException) {
      return FailedResult(_handleFirebaseError(error));
    } else if (error is SocketException) {
      return FailedResult('No internet connection. Please check your network.');
    } else {
      return FailedResult('Something went wrong. Please try again later.');
    }
  }

  static String _handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'invalid-credential':
        return 'Invalid credentials provided.';
      default:
        return 'Authentication error: ${error.message ?? "Unknown error"}';
    }
  }

  static String _handleFirebaseError(FirebaseException error) {
    final code = error.code;
    final plugin = error.plugin;
    final message = error.message ?? 'An unexpected Firebase error occurred.';

    if (plugin == 'cloud_firestore') {
      switch (code) {
        case 'permission-denied':
          return 'You do not have permission to perform this action.';
        case 'not-found':
          return 'The requested document was not found.';
        case 'already-exists':
          return 'The document already exists.';
        case 'unavailable':
          return 'Firestore is currently unavailable. Please try again.';
        default:
          return 'Firestore error: $message';
      }
    } else if (plugin == 'firebase_storage') {
      switch (code) {
        case 'object-not-found':
          return 'The requested file was not found.';
        case 'unauthorized':
          return 'You are not authorized to access this file.';
        case 'storage/retry-limit-exceeded':
          return 'Operation timed out. Please try again.';
        default:
          return 'Storage error: $message';
      }
    }

    return message;
  }
}
