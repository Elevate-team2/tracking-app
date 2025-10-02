import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/validator/validator.dart';

void main() {
  const String requiredField = 'this field is required';
  const String emailRequired = 'Email is required';
  const String invalidEmail = 'This Email is not valid';
  const String passwordRequired="Password is required";
  const String passwordTooShort = 'Password must be at least 6 characters';
  const String passwordNoUpper = 'Password must contain at least one uppercase letter';
  const String passwordNoNumber = 'Password must contain at least one number';
  const String passwordsMismatch = 'Passwords do not match';
  const String invalidUsername = 'Enter a valid username';
  const String numbersOnly = 'Enter numbers only';
  const String phoneLengthError = 'Value must be 11 digits after country code';

  group('Validator', () {
    group('validateEmail', () {
      test('returns error when email is null', () {
        expect(Validator.validateEmail(null), emailRequired);
      });

      test('returns error when email is empty', () {
        expect(Validator.validateEmail(''), emailRequired);
      });

      test('returns error when email is invalid', () {
        expect(Validator.validateEmail('invalid'), invalidEmail);
      });

      test('returns null when email is valid', () {
        expect(Validator.validateEmail('test@example.com'), null);
      });
    });

    group('validatePassword', () {
      test('returns error when password is null', () {
        expect(Validator.validatePassword(null), passwordRequired);
      });

      test('returns error when password is too short', () {
        expect(Validator.validatePassword('Ab1'), passwordTooShort);
      });

      test('returns error when password has no uppercase', () {
        expect(Validator.validatePassword('password1'), passwordNoUpper);
      });

      test('returns error when password has no number', () {
        expect(Validator.validatePassword('Password'), passwordNoNumber);
      });

      test('returns null when password is valid', () {
        expect(Validator.validatePassword('Password1'), null);
      });
    });

    group('validateConfirmPassword', () {
      test('returns error when confirm password is null', () {
        expect(Validator.validateConfirmPassword(null, 'Password1'), requiredField);
      });

      test('returns error when confirm password does not match', () {
        expect(Validator.validateConfirmPassword('Password2', 'Password1'), passwordsMismatch);
      });

      test('returns null when confirm password matches', () {
        expect(Validator.validateConfirmPassword('Password1', 'Password1'), null);
      });
    });

    group('validateUsername', () {
      test('returns error when username is null', () {
        expect(Validator.validateUsername(null), requiredField);
      });

      test('returns error when username is empty', () {
        expect(Validator.validateUsername(''), requiredField);
      });

      test('returns error when username is invalid', () {
        expect(Validator.validateUsername('invalid@'), invalidUsername);
      });

      test('returns null when username is valid', () {
        expect(Validator.validateUsername('validUser.1'), null);
      });
    });

    group('validateFullName', () {
      test('returns error when full name is null', () {
        expect(Validator.validateFullName(null), requiredField);
      });

      test('returns error when full name is empty', () {
        expect(Validator.validateFullName(''), requiredField);
      });

      test('returns null when full name is valid', () {
        expect(Validator.validateFullName('John Doe'), null);
      });
    });

    group('validatePhoneNumber', () {
      test('returns error when phone number is null', () {
        expect(Validator.validatePhoneNumber(null), requiredField);
      });

      test('returns error when phone number has letters', () {
        expect(Validator.validatePhoneNumber('123abc'), numbersOnly);
      });

      test('returns error when phone number is not 11 digits afer country code', () {
        expect(Validator.validatePhoneNumber('+20123456789'), phoneLengthError);
      });

      test('returns null when phone number is valid', () {
        expect(Validator.validatePhoneNumber('+201234567890'), null);
      });
    });
  });
}
