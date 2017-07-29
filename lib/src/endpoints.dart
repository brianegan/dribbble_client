class DribbbleEndpoints {
  static final defaultBaseUri = new Uri(
    scheme: 'https',
    host: 'api.dribbble.com',
  );

  final Uri baseUri;

  DribbbleEndpoints([Uri baseUri]) : this.baseUri = baseUri ?? defaultBaseUri;

  // Shots
  Uri popularShots([int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/shots", queryParameters: {
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri recentShots([int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/shots", queryParameters: {
        "sort": "recent",
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri debutShots([int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/shots", queryParameters: {
        "list": "debuts",
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri animatedShots([int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/shots", queryParameters: {
        "list": "animated",
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri teamShots(int teamId, [int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/teams/$teamId/shots", queryParameters: {
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri teamMembers(int teamId, [int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/teams/$teamId/members", queryParameters: {
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });

  Uri shot(int id) => baseUri.replace(path: "v1/shots/$id");

  Uri user(int id) => baseUri.replace(path: "v1/users/$id");

  Uri userShots(int userId, [int page = 0, int pageSize = 30]) =>
      baseUri.replace(path: "v1/users/$userId/shots", queryParameters: {
        "page": page.toString(),
        "per_page": pageSize.toString(),
      });
}
