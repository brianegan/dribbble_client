import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dribbble_client/src/endpoints.dart';
import 'package:dribbble_client/src/models/dribbble_collection.dart';
import 'package:dribbble_client/src/models/dribbble_scope.dart';
import 'package:dribbble_client/src/models/dribbble_shot.dart';
import 'package:dribbble_client/src/models/dribbble_token.dart';
import 'package:dribbble_client/src/models/dribbble_user.dart';
import 'package:http/http.dart';

class DribbbleClient {
  final Client client;
  final JsonDecoder jsonDecoder;
  final DribbbleEndpoints endpoints;
  final String clientId;
  final String clientSecret;
  final String appAccessToken;
  String userAccessToken;

  DribbbleClient(
    this.appAccessToken,
    this.clientId,
    this.clientSecret, {
    String userAccessToken,
    Client client,
    JsonDecoder jsonDecoder,
    DribbbleEndpoints endpoints,
  })
      : this.client = client ?? new Client(),
        this.jsonDecoder = jsonDecoder ?? new JsonDecoder(),
        this.endpoints = endpoints ?? new DribbbleEndpoints(),
        this.userAccessToken = userAccessToken;

  String get accessToken => "Bearer ${userAccessToken ?? appAccessToken}";

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

  /// Login using the OAuth2 temporary code from the OAuth2 flow, then store
  /// the access token so it can be used as part of the subsequent requests.
  ///
  /// As a dev, you can also persist the returned token securely. When your
  /// app starts up again, load the token from your secure persistence layer
  /// and initialize this client with it to continue as the logged in user.
  Future<DribbbleToken> login(
    String tempCode, {
    String redirectUri,
    String scope: 'public',
  }) async {
    final token = await fetchToken(tempCode);

    userAccessToken = token.accessToken;

    return token;
  }

  /// Fetch the OAuth2 token, but do not automatically store it as the
  /// userAccessToken
  Future<DribbbleToken> fetchToken(
    String tempCode, {
    String redirectUri,
    List<DribbbleScope> scopes = const [DribbbleScope.public],
  }) async {
    final json = await _fetch(endpoints.accessToken(
      clientId,
      clientSecret,
      tempCode,
      redirectUri: redirectUri,
      scopes: scopes,
    ));

    return new DribbbleToken.fromJson(json);
  }

  Future<DribbbleCollection<DribbbleShot>> fetchUserShots(int userId,
          {int page = 0, int pageSize = 30}) =>
      _fetchShots(endpoints.userShots(userId, page, pageSize));

  Future<dynamic> _fetch(Uri uri) async {
    final response = await _getWithAuthorization(uri);

    return jsonDecoder.convert(response.body);
  }

  Future<DribbbleCollection<DribbbleShot>> _fetchShots(Uri uri) async {
    final response = await _getWithAuthorization(uri);
    final json = jsonDecoder.convert(response.body);

    return DribbbleCollection.fromHeader<DribbbleShot>(
      json.map((json) => new DribbbleShot.fromJson(json)).toList(),
      response.headers['link'],
    );
  }

  Future<DribbbleCollection<DribbbleUser>> _fetchUsers(Uri uri) async {
    final response = await _getWithAuthorization(uri);
    final json = jsonDecoder.convert(response.body);

    return DribbbleCollection.fromHeader<DribbbleUser>(
      json.map((json) => new DribbbleUser.fromJson(json)).toList(),
      response.headers['link'],
    );
  }

  Future<Response> _getWithAuthorization(Uri uri) {
    return client.get(uri, headers: {HttpHeaders.AUTHORIZATION: accessToken});
  }
}
