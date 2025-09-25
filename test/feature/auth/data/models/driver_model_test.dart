import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/feature/auth/data/models/driver_model.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

void main() {
  group("DriverModel", () {
    final json = {
      "_id": "1",
      "firstName": "Mahmoud",
      "lastName": "Ibrahim",
      "phone": "01012345678",
      "gender": "male",
      "country": "Egypt",
      "vehicleType": "Car",
      "vehicleNumber": "123",
      "vehicleLicense": "file.png",
      "NID": "456",
      "NIDImg": "nid.png",
      "role": "driver",
      "photo": "photo.png",
      "createdAt": "2025-09-25T12:00:00.000Z",
      "email": "test@mail.com",
    };

    test("fromJson should create valid DriverModel", () {
      final model = DriverModel.fromJson(json);

      expect(model.id, "1");
      expect(model.firstName, "Mahmoud");
      expect(model.lastName, "Ibrahim");
      expect(model.phone, "01012345678");
      expect(model.gender, "male");
      expect(model.country, "Egypt");
      expect(model.vehicleType, "Car");
      expect(model.vehicleNumber, "123");
      expect(model.vehicleLicense, "file.png");
      expect(model.nid, "456");
      expect(model.nidImg, "nid.png");
      expect(model.role, "driver");
      expect(model.photo, "photo.png");
      expect(model.createdAt, "2025-09-25T12:00:00.000Z");
      expect(model.email, "test@mail.com");
    });

    test("toEntity should map DriverModel to Driver entity", () {
      final model = DriverModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity, isA<Driver>());
      expect(entity.firstName, "Mahmoud");
      expect(entity.nid, "456");
    });
  });
}
