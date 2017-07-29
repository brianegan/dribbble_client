import 'package:dribbble_client/src/models/dribbble_links.dart';

/// A Dribbble User
class DribbbleUser {
  final int id;
  final String name;
  final String username;
  final String htmlUrl;
  final String avatarUrl;
  final String bio;
  final String location;
  final DribbbleLinks links;
  final int bucketsCount;
  final int commentsReceivedCount;
  final int followersCount;
  final int followingsCount;
  final int likesCount;
  final int likesReceivedCount;
  final int projectsCount;
  final int reboundsReceivedCount;
  final int shotsCount;
  final int teamsCount;
  final bool canUploadShot;
  final String type;
  final bool pro;
  final String bucketsUrl;
  final String followersUrl;
  final String followingUrl;
  final String likesUrl;
  final String projectsUrl;
  final String shotsUrl;
  final String teamsUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  DribbbleUser(
      this.id,
      this.name,
      this.username,
      this.htmlUrl,
      this.avatarUrl,
      this.bio,
      this.location,
      this.bucketsCount,
      this.commentsReceivedCount,
      this.followersCount,
      this.likesCount,
      this.likesReceivedCount,
      this.reboundsReceivedCount,
      this.shotsCount,
      this.teamsCount,
      this.canUploadShot,
      this.type,
      this.pro,
      this.bucketsUrl,
      this.followersUrl,
      this.followingUrl,
      this.likesUrl,
      this.projectsUrl,
      this.shotsUrl,
      this.teamsUrl,
      this.createdAt,
      this.updatedAt,
      this.links,
      this.followingsCount,
      this.projectsCount);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'username': username,
        'html_url': htmlUrl,
        'avatar_url': avatarUrl,
        'bio': bio,
        'location': location,
        'links': links,
        'buckets_count': bucketsCount,
        'comments_received_count': commentsReceivedCount,
        'followers_count': followersCount,
        'followings_count': followingsCount,
        'likes_count': likesCount,
        'likes_received_count': likesReceivedCount,
        'projects_count': projectsCount,
        'rebounds_received_count': reboundsReceivedCount,
        'shots_count': shotsCount,
        'teams_count': teamsCount,
        'can_upload_shot': canUploadShot,
        'type': type,
        'pro': pro,
        'buckets_url': bucketsUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'likes_url': likesUrl,
        'projects_url': projectsUrl,
        'shots_url': shotsUrl,
        'teams_url': teamsUrl,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String()
      };

  factory DribbbleUser.fromJson(Map<String, dynamic> json) => new DribbbleUser(
      json['id'] as int,
      json['name'] as String,
      json['username'] as String,
      json['html_url'] as String,
      json['avatar_url'] as String,
      json['bio'] as String,
      json['location'] as String,
      json['buckets_count'] as int,
      json['comments_received_count'] as int,
      json['followers_count'] as int,
      json['likes_count'] as int,
      json['likes_received_count'] as int,
      json['rebounds_received_count'] as int,
      json['shots_count'] as int,
      json['teams_count'] as int,
      json['can_upload_shot'] as bool,
      json['type'] as String,
      json['pro'] as bool,
      json['buckets_url'] as String,
      json['followers_url'] as String,
      json['following_url'] as String,
      json['likes_url'] as String,
      json['projects_url'] as String,
      json['shots_url'] as String,
      json['teams_url'] as String,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['links'] == null
          ? null
          : new DribbbleLinks.fromJson(json['links'] as Map<String, dynamic>),
      json['followings_count'] as int,
      json['projects_count'] as int);

  @override
  String toString() {
    return 'DribbbleUser{id: $id, name: $name, username: $username, htmlUrl: $htmlUrl, avatarUrl: $avatarUrl, bio: $bio, location: $location, links: $links, bucketsCount: $bucketsCount, commentsReceivedCount: $commentsReceivedCount, followersCount: $followersCount, followingsCount: $followingsCount, likesCount: $likesCount, likesReceivedCount: $likesReceivedCount, projectsCount: $projectsCount, reboundsReceivedCount: $reboundsReceivedCount, shotsCount: $shotsCount, teamsCount: $teamsCount, canUploadShot: $canUploadShot, type: $type, pro: $pro, bucketsUrl: $bucketsUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, likesUrl: $likesUrl, projectsUrl: $projectsUrl, shotsUrl: $shotsUrl, teamsUrl: $teamsUrl, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          htmlUrl == other.htmlUrl &&
          avatarUrl == other.avatarUrl &&
          bio == other.bio &&
          location == other.location &&
          links == other.links &&
          bucketsCount == other.bucketsCount &&
          commentsReceivedCount == other.commentsReceivedCount &&
          followersCount == other.followersCount &&
          followingsCount == other.followingsCount &&
          likesCount == other.likesCount &&
          likesReceivedCount == other.likesReceivedCount &&
          projectsCount == other.projectsCount &&
          reboundsReceivedCount == other.reboundsReceivedCount &&
          shotsCount == other.shotsCount &&
          teamsCount == other.teamsCount &&
          canUploadShot == other.canUploadShot &&
          type == other.type &&
          pro == other.pro &&
          bucketsUrl == other.bucketsUrl &&
          followersUrl == other.followersUrl &&
          followingUrl == other.followingUrl &&
          likesUrl == other.likesUrl &&
          projectsUrl == other.projectsUrl &&
          shotsUrl == other.shotsUrl &&
          teamsUrl == other.teamsUrl &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      htmlUrl.hashCode ^
      avatarUrl.hashCode ^
      bio.hashCode ^
      location.hashCode ^
      links.hashCode ^
      bucketsCount.hashCode ^
      commentsReceivedCount.hashCode ^
      followersCount.hashCode ^
      followingsCount.hashCode ^
      likesCount.hashCode ^
      likesReceivedCount.hashCode ^
      projectsCount.hashCode ^
      reboundsReceivedCount.hashCode ^
      shotsCount.hashCode ^
      teamsCount.hashCode ^
      canUploadShot.hashCode ^
      type.hashCode ^
      pro.hashCode ^
      bucketsUrl.hashCode ^
      followersUrl.hashCode ^
      followingUrl.hashCode ^
      likesUrl.hashCode ^
      projectsUrl.hashCode ^
      shotsUrl.hashCode ^
      teamsUrl.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
