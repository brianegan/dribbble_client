import 'package:dribbble_client/src/models/dribbble_scope.dart';

class DribbbleToken {
  final String accessToken;
  final String tokenType;
  final List<DribbbleScope> scopes;

  DribbbleToken(this.accessToken, this.tokenType, this.scopes);

  factory DribbbleToken.fromJson(Map<String, dynamic> json) =>
      new DribbbleToken(
        json["access_token"] as String,
        json["token_type"] as String,
        (json["scope"] as String)
            .split('+')
            .map(getScopeFromString)
            .where((scope) => scope != null)
            .toList(),
      );

  @override
  String toString() {
    return 'DribbbleToken{accessToken: $accessToken, tokenType: $tokenType, scope: $scopes}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleToken &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          tokenType == other.tokenType &&
          scopes == other.scopes;

  @override
  int get hashCode =>
      accessToken.hashCode ^ tokenType.hashCode ^ scopes.hashCode;
}
