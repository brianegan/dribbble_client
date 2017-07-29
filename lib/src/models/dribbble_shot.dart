import 'package:dribbble_client/src/models/dribbble_user.dart';
import 'package:dribbble_client/src/models/dribbble_images.dart';

/// The main show: A Dribbble Shot!
class DribbbleShot {
  final int id;
  final String title;
  final String description;
  final int width;
  final int height;
  final DribbbleImages images;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;
  final int attachmentsCount;
  final int reboundsCount;
  final int bucketsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String htmlUrl;
  final String attachmentsUrl;
  final String bucketsUrl;
  final String commentsUrl;
  final String likesUrl;
  final String projectsUrl;
  final String reboundsUrl;
  final bool animated;
  final List<String> tags;
  final DribbbleUser user;
  final DribbbleUser team;

  DribbbleShot(
      this.id,
      this.title,
      this.description,
      this.width,
      this.height,
      this.images,
      this.viewsCount,
      this.likesCount,
      this.commentsCount,
      this.attachmentsCount,
      this.reboundsCount,
      this.bucketsCount,
      this.createdAt,
      this.updatedAt,
      this.htmlUrl,
      this.attachmentsUrl,
      this.bucketsUrl,
      this.commentsUrl,
      this.likesUrl,
      this.projectsUrl,
      this.reboundsUrl,
      this.animated,
      this.tags,
      this.user,
      this.team);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'width': width,
        'height': height,
        'images': images,
        'views_count': viewsCount,
        'likes_count': likesCount,
        'comments_count': commentsCount,
        'attachments_count': attachmentsCount,
        'rebounds_count': reboundsCount,
        'buckets_count': bucketsCount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'html_url': htmlUrl,
        'attachments_url': attachmentsUrl,
        'buckets_url': bucketsUrl,
        'comments_url': commentsUrl,
        'likes_url': likesUrl,
        'projects_url': projectsUrl,
        'rebounds_url': reboundsUrl,
        'animated': animated,
        'tags': tags,
        'user': user,
        'team': team
      };

  factory DribbbleShot.fromJson(Map<String, dynamic> json) => new DribbbleShot(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['width'] as int,
      json['height'] as int,
      json['images'] == null
          ? null
          : new DribbbleImages.fromJson(json['images'] as Map<String, dynamic>),
      json['views_count'] as int,
      json['likes_count'] as int,
      json['comments_count'] as int,
      json['attachments_count'] as int,
      json['rebounds_count'] as int,
      json['buckets_count'] as int,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['html_url'] as String,
      json['attachments_url'] as String,
      json['buckets_url'] as String,
      json['comments_url'] as String,
      json['likes_url'] as String,
      json['projects_url'] as String,
      json['rebounds_url'] as String,
      json['animated'] as bool,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['user'] == null
          ? null
          : new DribbbleUser.fromJson(json['user'] as Map<String, dynamic>),
      json['team'] == null
          ? null
          : new DribbbleUser.fromJson(json['team'] as Map<String, dynamic>));

  @override
  String toString() {
    return 'DribbbleShot{id: $id, title: $title, description: $description, width: $width, height: $height, images: $images, viewsCount: $viewsCount, likesCount: $likesCount, commentsCount: $commentsCount, attachmentsCount: $attachmentsCount, reboundsCount: $reboundsCount, bucketsCount: $bucketsCount, createdAt: $createdAt, updatedAt: $updatedAt, htmlUrl: $htmlUrl, attachmentsUrl: $attachmentsUrl, bucketsUrl: $bucketsUrl, commentsUrl: $commentsUrl, likesUrl: $likesUrl, projectsUrl: $projectsUrl, reboundsUrl: $reboundsUrl, animated: $animated, tags: $tags, user: $user, team: $team}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleShot &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          width == other.width &&
          height == other.height &&
          images == other.images &&
          viewsCount == other.viewsCount &&
          likesCount == other.likesCount &&
          commentsCount == other.commentsCount &&
          attachmentsCount == other.attachmentsCount &&
          reboundsCount == other.reboundsCount &&
          bucketsCount == other.bucketsCount &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          htmlUrl == other.htmlUrl &&
          attachmentsUrl == other.attachmentsUrl &&
          bucketsUrl == other.bucketsUrl &&
          commentsUrl == other.commentsUrl &&
          likesUrl == other.likesUrl &&
          projectsUrl == other.projectsUrl &&
          reboundsUrl == other.reboundsUrl &&
          animated == other.animated &&
          tags == other.tags &&
          user == other.user &&
          team == other.team;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      width.hashCode ^
      height.hashCode ^
      images.hashCode ^
      viewsCount.hashCode ^
      likesCount.hashCode ^
      commentsCount.hashCode ^
      attachmentsCount.hashCode ^
      reboundsCount.hashCode ^
      bucketsCount.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      htmlUrl.hashCode ^
      attachmentsUrl.hashCode ^
      bucketsUrl.hashCode ^
      commentsUrl.hashCode ^
      likesUrl.hashCode ^
      projectsUrl.hashCode ^
      reboundsUrl.hashCode ^
      animated.hashCode ^
      tags.hashCode ^
      user.hashCode ^
      team.hashCode;
}
