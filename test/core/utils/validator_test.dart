import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/utils/validator.dart';

void main() {
  group('Validator', () {
    group('validateEmail', () {
      test('returns error when email is null', () {
        expect(Validator.validateEmail(null), 'Email  is required');
      });

      test('returns error when email is empty', () {
        expect(Validator.validateEmail(''), ' Email  is required');
      });

      test('returns error when email is invalid', () {
        expect(Validator.validateEmail('invalid'), 'This Email is not valid');
      });

      test('returns null when email is valid', () {
        expect(Validator.validateEmail('test@example.com'), null);
      });
    });

    group('validatePassword', () {
      test('returns error when password is null', () {
        expect(Validator.validatePassword(null), 'Password is required');
      });

      test('returns error when password is too short', () {
        expect(Validator.validatePassword('Ab1'), 'Password must be at least 6 characters');
      });

      test('returns error when password has no uppercase', () {
        expect(Validator.validatePassword('password1'), 'Password must contain at least one uppercase letter');
      });

      test('returns error when password has no number', () {
        expect(Validator.validatePassword('Password'), 'Password must contain at least one number');
      });

      test('returns null when password is valid', () {
        expect(Validator.validatePassword('Password1'), null);
      });
    });

    group('validateConfirmPassword', () {
      test('returns error when confirm password is null', () {
        expect(Validator.validateConfirmPassword(null, 'Password1'), 'this field is required');
      });

      test('returns error when confirm password does not match', () {
        expect(Validator.validateConfirmPassword('Password2', 'Password1'), 'same password');
      });

      test('returns null when confirm password matches', () {
        expect(Validator.validateConfirmPassword('Password1', 'Password1'), null);
      });
    });

    group('validateUsername', () {
      test('returns error when username is null', () {
        expect(Validator.validateUsername(null), 'this field is required');
      });

      test('returns error when username is empty', () {
        expect(Validator.validateUsername(''), 'this field is required');
      });

      test('returns error when username is invalid', () {
        expect(Validator.validateUsername('invalid@'), 'enter valid username');
      });

      test('returns null when username is valid', () {
        expect(Validator.validateUsername('validUser.1'), null);
      });
    });

    group('validateFullName', () {
      test('returns error when full name is null', () {
        expect(Validator.validateFullName(null), 'this field is required');
      });

      test('returns error when full name is empty', () {
        expect(Validator.validateFullName(''), 'this field is required');
      });

      test('returns null when full name is valid', () {
        expect(Validator.validateFullName('John Doe'), null);
      });
    });

    group('validatePhoneNumber', () {
      test('returns error when phone number is null', () {
        expect(Validator.validatePhoneNumber(null), 'this field is required');
      });

      test('returns error when phone number has letters', () {
        expect(Validator.validatePhoneNumber('123abc'), 'enter numbers only');
      });

      test('returns error when phone number is not 11 digits', () {
        expect(Validator.validatePhoneNumber('123456789'), 'enter value must equal 11 digit');
      });

      test('returns null when phone number is valid', () {
        expect(Validator.validatePhoneNumber('01234567890'), null);
      });
    });
  });
}
