import 'dart:async';
import 'dart:convert';
import 'package:dribbble_client/src/endpoints.dart';
import 'package:dribbble_client/src/models/dribbble_collection.dart';
import 'package:dribbble_client/src/models/dribbble_shot.dart';
import 'package:dribbble_client/src/models/dribbble_user.dart';
import 'package:http/http.dart';

class DribbbleClient {
  final String accessToken;
  final Client client;
  final JsonDecoder jsonDecoder;
  final Utf8Decoder utf8Decoder;
  final DribbbleEndpoints endpoints;

  DribbbleClient(
    this.accessToken, {
    Client client,
    JsonDecoder jsonDecoder,
    Utf8Decoder utf8Decoder,
    DribbbleEndpoints endpoints,
  })
      : this.client = client ?? new Client(),
        this.jsonDecoder = jsonDecoder ?? new JsonDecoder(),
        this.utf8Decoder = utf8Decoder ?? new Utf8Decoder(),
        this.endpoints = endpoints ?? new DribbbleEndpoints();

  // Shots
  Future<DribbbleShot> fetchShot(int id) async {
    final json = await _fetch(endpoints.shot(id));

    return new DribbbleShot.fromJson(json);
  }

  Future<DribbbleCollection<DribbbleShot>> fetchPopularShots(
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.popularShots(page, pageSize));

  Future<DribbbleCollection<DribbbleShot>> fetchRecentShots(
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.recentShots(page, pageSize));

  Future<DribbbleCollection<DribbbleShot>> fetchDebutShots(
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.debutShots(page, pageSize));

  Future<DribbbleCollection<DribbbleShot>> fetchAnimatedShots(
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.animatedShots(page, pageSize));

  // Teams
  Future<DribbbleCollection<DribbbleShot>> fetchTeamShots(int teamId,
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.teamShots(teamId, page, pageSize));

  Future<DribbbleCollection<DribbbleUser>> fetchTeamMembers(int teamId,
          {int page = 0, int pageSize = 30}) =>
      _fetchUsers(endpoints.teamMembers(teamId, page, pageSize));

  // User
  Future<DribbbleUser> fetchUser(int id) async {
    final json = await _fetch(endpoints.user(id));

    return new DribbbleUser.fromJson(json);
  }

  Future<DribbbleCollection<DribbbleShot>> fetchUserShots(int userId,
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.userShots(userId, page, pageSize));

  Future<dynamic> _fetch(Uri uri) async {
    final finalUri = _appendAccessToken(uri);
    final response = await client.get(finalUri);

    return jsonDecoder.convert(response.body);
  }

  Future<DribbbleCollection<DribbbleShot>> _fetchShots(Uri uri) async {
    final finalUri = _appendAccessToken(uri);
    final response = await client.get(finalUri);
    final json = jsonDecoder.convert(response.body);

    return DribbbleCollection.fromHeader<DribbbleShot>(
      json.map((json) => new DribbbleShot.fromJson(json)).toList(),
      response.headers['link'],
    );
  }

  Future<DribbbleCollection<DribbbleUser>> _fetchUsers(Uri uri) async {
    final finalUri = _appendAccessToken(uri);
    final response = await client.get(finalUri);
    final json = jsonDecoder.convert(response.body);

    return DribbbleCollection.fromHeader<DribbbleUser>(
      json.map((json) => new DribbbleUser.fromJson(json)).toList(),
      response.headers['link'],
    );
  }

  Uri _appendAccessToken(Uri uri) {
    final queryParams = new Map.from(uri.queryParameters)
      ..putIfAbsent('access_token', () => accessToken);

    return uri.replace(queryParameters: queryParams);
  }
}
