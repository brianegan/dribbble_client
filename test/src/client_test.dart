import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:http_mock/http_mock.dart';
import 'package:dribbble_client/dribbble_client.dart';

void main() {
  group('Dribbble Api', () {
    final testToken = "TEST_TOKEN";
    final testId = "TEST_ID";
    final testSecret = "TEST_SECRET";

    MockClient httpClient;
    DribbbleClient dribbbleClient;
    DribbbleEndpoints endpoints =
        new DribbbleEndpoints(new Uri(host: 'localhost'));

    setUp(() {
      httpClient = new MockClient();
      dribbbleClient = new DribbbleClient(
        testToken,
        testId,
        testSecret,
        client: httpClient,
      );
    });

    tearDown(() {
      httpClient.close();
    });

    String loadFixture(String path) {
      return new String.fromCharCodes(new Utf8Encoder()
          .convert(new File('test/fixtures/$path.json').readAsStringSync()));
    }

    mockEndpoint(String uriPath, String filePath) {
      httpClient.router
        ..get(uriPath, (MockHttpContext context) {
          return new Response(loadFixture(filePath), 200, headers: {
            'link':
                '<https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=3>; rel="next"'
          });
        });
    }

    test('fetches a single shot with correct encoding', () async {
      final id = 3693583;
      final endpoint = endpoints.shot(id);
      final isInt = new isInstanceOf<int>();
      final isDateTime = new isInstanceOf<DateTime>();

      mockEndpoint(endpoint.path, endpoint.path);

      final shot = await dribbbleClient.fetchShot(id);

      // Shot Properties
      expect(shot.id, 3693583);
      expect(shot.title, "\$TRUT");
      expect(shot.description, new isInstanceOf<String>());
      expect(shot.width, 400);
      expect(shot.height, 300);
      expect(shot.images.hiDpi,
          "https://cdn.dribbble.com/users/626327/screenshots/3693583/strut.gif");
      expect(shot.images.normal,
          "https://cdn.dribbble.com/users/626327/screenshots/3693583/strut_1x.gif");
      expect(shot.images.teaser,
          "https://cdn.dribbble.com/users/626327/screenshots/3693583/strut_teaser.gif");
      expect(shot.viewsCount, isInt);
      expect(shot.likesCount, isInt);
      expect(shot.commentsCount, isInt);
      expect(shot.attachmentsCount, isInt);
      expect(shot.reboundsCount, isInt);
      expect(shot.bucketsCount, isInt);
      expect(shot.createdAt, isDateTime);
      expect(shot.updatedAt, isDateTime);
      expect(shot.htmlUrl, "https://dribbble.com/shots/3693583--TRUT");
      expect(shot.attachmentsUrl,
          "https://api.dribbble.com/v1/shots/3693583/attachments");
      expect(
          shot.bucketsUrl, "https://api.dribbble.com/v1/shots/3693583/buckets");
      expect(shot.commentsUrl,
          "https://api.dribbble.com/v1/shots/3693583/comments");
      expect(shot.likesUrl, "https://api.dribbble.com/v1/shots/3693583/likes");
      expect(shot.projectsUrl,
          "https://api.dribbble.com/v1/shots/3693583/projects");
      expect(shot.reboundsUrl,
          "https://api.dribbble.com/v1/shots/3693583/rebounds");
      expect(shot.animated, true);
      expect(shot.tags, [
        "gentleman",
        "monocle",
        "posh",
        "rubber hose",
        "rubberhose",
        "walk. man"
      ]);

      // User Properties
      final user = shot.user;

      expect(user.id, 626327);
      expect(user.name, "Tomas Brunsdon");
      expect(user.username, "TomasBrunsdon");
      expect(user.htmlUrl, "https://dribbble.com/TomasBrunsdon");
      expect(user.avatarUrl,
          "https://cdn.dribbble.com/users/626327/avatars/normal/5ea7712112f60bfe483962ad9d591bbd.jpg?1466168506");
      expect(user.bio,
          "Londoner lost in the Caucasus. Unwillingly distinct.\nhello@tomasbrunsdon.com");
      expect(user.location, "Tbilisi");
      expect(user.links.twitter, "https://twitter.com/tomasbrunsdon");
      expect(user.bucketsCount, isInt);
      expect(user.commentsReceivedCount, isInt);
      expect(user.followersCount, isInt);
      expect(user.followingsCount, isInt);
      expect(user.likesCount, isInt);
      expect(user.likesReceivedCount, isInt);
      expect(user.projectsCount, isInt);
      expect(user.reboundsReceivedCount, isInt);
      expect(user.shotsCount, isInt);
      expect(user.teamsCount, isInt);
      expect(user.canUploadShot, true);
      expect(user.type, "Player");
      expect(user.pro, true);
      expect(
          user.bucketsUrl, "https://api.dribbble.com/v1/users/626327/buckets");
      expect(user.followersUrl,
          "https://api.dribbble.com/v1/users/626327/followers");
      expect(user.followingUrl,
          "https://api.dribbble.com/v1/users/626327/following");
      expect(user.likesUrl, "https://api.dribbble.com/v1/users/626327/likes");
      expect(user.projectsUrl,
          "https://api.dribbble.com/v1/users/626327/projects");
      expect(user.shotsUrl, "https://api.dribbble.com/v1/users/626327/shots");
      expect(user.teamsUrl, "https://api.dribbble.com/v1/users/626327/teams");
      expect(user.createdAt, isDateTime);
      expect(user.updatedAt, isDateTime);
    });

    test('fetches a list of popular shots', () async {
      final endpoint = endpoints.popularShots();

      mockEndpoint(endpoint.path, endpoint.path);

      final collection = await dribbbleClient.fetchPopularShots();
      expect(collection, new isInstanceOf<DribbbleCollection<DribbbleShot>>());
      expect(collection.hasNext, isTrue);
    });

    test('fetches a list of recent shots', () async {
      final endpoint = endpoints.recentShots();

      mockEndpoint(endpoint.path, "${endpoint.path}?${endpoint.query}");

      await expect(dribbbleClient.fetchRecentShots(),
          completion(new isInstanceOf<DribbbleCollection<DribbbleShot>>()));
    });

    test('fetches a list of animated shots', () async {
      final endpoint = endpoints.animatedShots();

      mockEndpoint(endpoint.path, "${endpoint.path}?${endpoint.query}");

      await expect(dribbbleClient.fetchAnimatedShots(),
          completion(new isInstanceOf<DribbbleCollection<DribbbleShot>>()));
    });

    test('fetches a list of debut shots', () async {
      final endpoint = endpoints.debutShots();

      mockEndpoint(endpoint.path, "${endpoint.path}?${endpoint.query}");

      await expect(dribbbleClient.fetchDebutShots(),
          completion(new isInstanceOf<DribbbleCollection<DribbbleShot>>()));
    });

    test("fetches a user's shots", () async {
      final userId = 2;
      final endpoint = endpoints.userShots(userId);

      mockEndpoint(endpoint.path, endpoint.path);

      await expect(dribbbleClient.fetchUserShots(userId),
          completion(new isInstanceOf<DribbbleCollection<DribbbleShot>>()));
    });

    test('fetches a list of team shots', () async {
      final teamId = 40433;
      final endpoint = endpoints.teamShots(teamId);

      mockEndpoint(endpoint.path, endpoint.path);

      await expect(dribbbleClient.fetchTeamShots(teamId),
          completion(new isInstanceOf<DribbbleCollection<DribbbleShot>>()));
    });

    test('fetches a list of team members', () async {
      final teamId = 40433;
      final endpoint = endpoints.teamMembers(teamId);

      mockEndpoint(endpoint.path, endpoint.path);

      final members = await dribbbleClient.fetchTeamMembers(teamId);
      expect(members, new isInstanceOf<DribbbleCollection<DribbbleUser>>());
      expect(members.collection.first.id, 2645);
    });

    test('fetches a single user', () async {
      final userId = 1;
      final endpoint = endpoints.user(userId);

      mockEndpoint(endpoint.path, endpoint.path);

      final user = await dribbbleClient.fetchUser(userId);
      expect(user, new isInstanceOf<DribbbleUser>());
      expect(user.id, 1);
    });

    test('fetches an api token', () async {
      final tempCode = '123456';
      final endpoint = endpoints.accessToken(testId, testSecret, tempCode);

      mockEndpoint(endpoint.path, endpoint.path);

      final token = await dribbbleClient.fetchToken(tempCode);
      expect(token, new isInstanceOf<DribbbleToken>());
    });

    test('logging in saves the user access token', () async {
      final tempCode = '123456';
      final endpoint = endpoints.accessToken(testId, testSecret, tempCode);

      mockEndpoint(endpoint.path, endpoint.path);

      expect(dribbbleClient.accessToken, "Bearer $testToken");
      expect(
        await dribbbleClient.login(tempCode),
        new isInstanceOf<DribbbleToken>(),
      );
      expect(
        dribbbleClient.accessToken,
        "Bearer USER_TOKEN",
      );
    });
  });
}
