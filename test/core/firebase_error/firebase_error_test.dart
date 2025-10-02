import 'package:flutter_test/flutter_test.dart';

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracking_app/core/firebase_error/firebase_error.dart';

void main() {
  group('FirebaseErrorHandler.handle', () {
    test('returns correct message for FirebaseAuthException - invalid-email', () {
      final error = FirebaseAuthException(code: 'invalid-email');
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'The email address is not valid.');
    });

    test('returns correct message for FirebaseAuthException - wrong-password', () {
      final error = FirebaseAuthException(code: 'wrong-password');
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'Incorrect password. Please try again.');
    });

    test('returns default message for unknown FirebaseAuthException', () {
      final error = FirebaseAuthException(
        code: 'random-code',
        message: 'Custom error',
      );
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'Authentication error: Custom error');
    });

    test('returns correct message for Firestore permission-denied', () {
      final error = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'permission-denied',
      );
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'You do not have permission to perform this action.');
    });

    test('returns correct message for Firestore not-found', () {
      final error = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'not-found',
      );
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'The requested document was not found.');
    });

    test('returns correct message for FirebaseStorage unauthorized', () {
      final error = FirebaseException(
        plugin: 'firebase_storage',
        code: 'unauthorized',
      );
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'You are not authorized to access this file.');
    });

    test('returns SocketException message', () {
      const error = SocketException('No internet');
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'No internet connection. Please check your network.');
    });

    test('returns generic error for unknown exception', () {
      final error = Exception('unexpected');
      final result = FirebaseErrorHandler.handle(error);
      expect(result.errorMessage, 'Something went wrong. Please try again later.');
    });
  });
}
