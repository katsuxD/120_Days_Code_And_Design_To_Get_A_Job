import 'dart:math';

import 'package:weather_app_open_weather_api/core/either.dart';
import 'package:weather_app_open_weather_api/core/failure.dart';
import 'package:weather_app_open_weather_api/data/models/city_model.dart';
import 'package:weather_app_open_weather_api/domain/entities/city.dart';
import 'package:riverpod/riverpod.dart';

const _randomCityNames = [
  'Amsterdam',
  'London',
  'Paris',
  'New York',
  'Las Vegas',
  'Texas',
  'Ohio',
  'Riyadh',
  'Dubai',
  'Istanbul',
  'Berlin',
  'Tokyo',
  'Doha',
  'Venice',
  'Sydney',
];

class CityRandomDataSource {
  Future<Either<Failure, CityModel>> getCity() async => Right(
        CityModel(
          City(
            name: _randomCityNames[Random().nextInt(_randomCityNames.length)],
          ),
        ),
      );
}

final cityRandomDataSourceProvider = Provider((ref) => CityRandomDataSource());
