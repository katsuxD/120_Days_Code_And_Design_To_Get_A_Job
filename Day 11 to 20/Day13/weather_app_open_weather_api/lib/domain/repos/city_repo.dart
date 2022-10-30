import 'package:weather_app_open_weather_api/core/either.dart';
import 'package:weather_app_open_weather_api/core/failure.dart';
import 'package:weather_app_open_weather_api/domain/entities/city.dart';
import 'package:riverpod/riverpod.dart';

abstract class CityRepo {
  Future<Either<Failure, City>> getCity();

  Future<Either<Failure, void>> setCity(City city);
}

final cityRepoProvider =
    Provider<CityRepo>((ref) => throw UnimplementedError());
