import 'package:dartz/dartz.dart';
import '../../../../domain/entities/place_entity.dart';
import '../../../../domain/services/http_service/http_service.dart';
import '../../../../domain/utils/utils.dart';
import '../../../../infra/datasources/remote/places_datasource/place_remote_datasource.dart';

class PlaceRemoteDataSourceImplementation implements PlaceRemoteDataSource {
  final HttpService httpService;

  PlaceRemoteDataSourceImplementation(this.httpService);
  @override
  Future<Either<Exception, List<Place>>> fetchAllPlaces() async {
    var response = await httpService.get(Utils.getPlaceApiEndpoint);
    if (response.statusCode != null) {
      List<Place> placesList = [];
      for (var element in response.data['places']) {
        placesList.add(Place.fromJson(element));
      }
      return right(placesList);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, Place>> fetchPlaceById(String id) async {
    var response = await httpService
        .get(Utils.getPlaceApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(Place.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, Place>> registerPlace(Place place) async {
    var response = await httpService.post(Utils.postPlaceApiEndpoint,
        data: place.toJson());
    if (response.statusCode != null) {
      return right(Place.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }
}
