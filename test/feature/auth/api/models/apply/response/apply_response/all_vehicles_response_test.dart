import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/feature/auth/api/models/apply/response/apply_response/all_vehicles_response.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

void main() {
  group('AllVehiclesResponse', () {
    test('should create AllVehiclesResponse from json', () {
      // Arrange
      final json = {
        'message': 'Success',
        'metadata': {
          'currentPage': 1,
          'totalPages': 5,
          'limit': 10,
          'totalItems': 50,
        },
        'vehicles': [
          {
            '_id': '123',
            'type': 'Car',
            'image': 'car.png',
            'createdAt': '2023-01-01',
            'updatedAt': '2023-01-02',
            '__v': 120,
          }
        ],
      };

      // Act
      final response = AllVehiclesResponse.fromJson(json);

      // Assert
      expect(response.message, 'Success');
      expect(response.metadata, isNotNull);
      expect(response.vehicles, hasLength(1));
    });

    test('should convert AllVehiclesResponse to json', () {
      // Arrange
      final metadata = Metadata(
        currentPage: 1,
        totalPages: 5,
        limit: 10,
        totalItems: 50,
      );

      final vehicle = Vehicles(
        id: '123',
        type: 'Car',
        image: 'car.png',
        createdAt: '2023-01-01',
        updatedAt: '2023-01-02',
        speed: 120,
      );

      final response = AllVehiclesResponse(
        message: 'Success',
        metadata: metadata,
        vehicles: [vehicle],
      );

      // Act
      final json = response.toJson();

      // Assert
      expect(json['message'], 'Success');
      expect(json['metadata'], isNotNull);
      expect(json['vehicles'], isList);
    });

    test('should handle empty AllVehiclesResponse', () {



      // Act
      final response = AllVehiclesResponse.fromJson({});

      // Assert
      expect(response.message, isNull);
      expect(response.metadata, isNull);
      expect(response.vehicles, isNull);
    });
  });

  group('Metadata', () {
    test('should create Metadata from json', () {
      // Arrange
      final json = {
        'currentPage': 1,
        'totalPages': 5,
        'limit': 10,
        'totalItems': 50,
      };

      // Act
      final metadata = Metadata.fromJson(json);

      // Assert
      expect(metadata.currentPage, 1);
      expect(metadata.totalPages, 5);
      expect(metadata.limit, 10);
      expect(metadata.totalItems, 50);
    });

    test('should convert Metadata to json', () {
      // Arrange
      final metadata = Metadata(
        currentPage: 1,
        totalPages: 5,
        limit: 10,
        totalItems: 50,
      );

      // Act
      final json = metadata.toJson();

      // Assert
      expect(json['currentPage'], 1);
      expect(json['totalPages'], 5);
      expect(json['limit'], 10);
      expect(json['totalItems'], 50);
    });

    test('should handle partial Metadata json', () {
      // Arrange
      final json = {
        'currentPage': 1,
        'limit': 10,
      };

      // Act
      final metadata = Metadata.fromJson(json);

      // Assert
      expect(metadata.currentPage, 1);
      expect(metadata.totalPages, isNull);
      expect(metadata.limit, 10);
      expect(metadata.totalItems, isNull);
    });
  });

  group('Vehicles', () {
    test('should create Vehicles from json', () {
      // Arrange
      final json = {
        '_id': '123',
        'type': 'Car',
        'image': 'car.png',
        'createdAt': '2023-01-01',
        'updatedAt': '2023-01-02',
        '__v': 120,
      };

      // Act
      final vehicle = Vehicles.fromJson(json);

      // Assert
      expect(vehicle.id, '123');
      expect(vehicle.type, 'Car');
      expect(vehicle.image, 'car.png');
      expect(vehicle.createdAt, '2023-01-01');
      expect(vehicle.updatedAt, '2023-01-02');
      expect(vehicle.speed, 120);
    });

    test('should convert Vehicles to json', () {
      // Arrange
      final vehicle = Vehicles(
        id: '123',
        type: 'Car',
        image: 'car.png',
        createdAt: '2023-01-01',
        updatedAt: '2023-01-02',
        speed: 120,
      );

      // Act
      final json = vehicle.toJson();

      // Assert
      expect(json['_id'], '123');
      expect(json['type'], 'Car');
      expect(json['image'], 'car.png');
      expect(json['createdAt'], '2023-01-01');
      expect(json['updatedAt'], '2023-01-02');
      expect(json['__v'], 120);
    });

    test('should convert Vehicles to VehicleEntity', () {
      // Arrange
      final vehicle = Vehicles(
        id: '123',
        type: 'Car',
        image: 'car.png',
        createdAt: '2023-01-01',
        updatedAt: '2023-01-02',
        speed: 120,
      );

      // Act
      final entity = vehicle.toEntity();

      // Assert
      expect(entity, isA<VehicleEntity>());
      expect(entity.id, '123');
      expect(entity.type, 'Car');
      expect(entity.image, 'car.png');
      expect(entity.createdAt, '2023-01-01');
      expect(entity.updatedAt, '2023-01-02');
      expect(entity.speed, 120);
    });

    test('should handle partial Vehicles json', () {
      // Arrange
      final json = {
        '_id': '123',
        'type': 'Car',
      };

      // Act
      final vehicle = Vehicles.fromJson(json);

      // Assert
      expect(vehicle.id, '123');
      expect(vehicle.type, 'Car');
      expect(vehicle.image, isNull);
      expect(vehicle.createdAt, isNull);
      expect(vehicle.updatedAt, isNull);
      expect(vehicle.speed, isNull);
    });


  });

  group('Edge Cases', () {
    test('should handle AllVehiclesResponse with empty vehicles list', () {
      // Arrange
      final json = {
        'message': 'No vehicles found',
        'metadata': {
          'currentPage': 1,
          'totalPages': 0,
          'limit': 10,
          'totalItems': 0,
        },
        'vehicles': [],
      };

      // Act
      final response = AllVehiclesResponse.fromJson(json);

      // Assert
      expect(response.message, 'No vehicles found');
      expect(response.vehicles, isEmpty);
      expect(response.metadata!.totalItems, 0);
    });

    test('should handle AllVehiclesResponse with multiple vehicles', () {
      // Arrange
      final json = {
        'message': 'Success',
        'metadata': {
          'currentPage': 1,
          'totalPages': 2,
          'limit': 2,
          'totalItems': 4,
        },
        'vehicles': [
          {
            '_id': '1',
            'type': 'Car',
            'image': 'car.png',
            'createdAt': '2023-01-01',
            'updatedAt': '2023-01-02',
            '__v': 120,
          },
          {
            '_id': '2',
            'type': 'Motorcycle',
            'image': 'bike.png',
            'createdAt': '2023-01-03',
            'updatedAt': '2023-01-04',
            '__v': 180,
          },
        ],
      };

      // Act
      final response = AllVehiclesResponse.fromJson(json);

      // Assert
      expect(response.vehicles, hasLength(2));
      expect(response.vehicles![0].type, 'Car');
      expect(response.vehicles![1].type, 'Motorcycle');
      expect(response.metadata!.totalItems, 4);
    });

  });
}