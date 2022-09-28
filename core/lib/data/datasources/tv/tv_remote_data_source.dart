import 'dart:convert';
import 'package:core/data/models/tv/tv_model.dart';
import 'package:core/utils/exception.dart';
import 'package:core/data/models/tv/tv_detail_model.dart';
import 'package:core/data/models/tv/tv_response.dart';
import 'package:http/http.dart' as http;

abstract class TvSerialRemoteDataSource {
  Future<List<TvSerialModel>> getNowPlayingTvSerials();
  Future<List<TvSerialModel>> getPopularTvSerials();
  Future<List<TvSerialModel>> getTopRatedTvSerials();
  Future<TvSerialDetailResponse> getTvSerialDetail(int id);
  Future<List<TvSerialModel>> getTvSerialRecommendations(int id);
  Future<List<TvSerialModel>> searchTvSerials(String query);
}

class TvSerialRemoteDataSourceImpl implements TvSerialRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvSerialRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvSerialModel>> getNowPlayingTvSerials() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSerialResponse.fromJson(json.decode(response.body)).tvSerialList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvSerialDetailResponse> getTvSerialDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSerialDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSerialModel>> getTvSerialRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSerialResponse.fromJson(json.decode(response.body)).tvSerialList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSerialModel>> getPopularTvSerials() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSerialResponse.fromJson(json.decode(response.body)).tvSerialList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSerialModel>> getTopRatedTvSerials() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSerialResponse.fromJson(json.decode(response.body)).tvSerialList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSerialModel>> searchTvSerials(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvSerialResponse.fromJson(json.decode(response.body)).tvSerialList;
    } else {
      throw ServerException();
    }
  }
}
