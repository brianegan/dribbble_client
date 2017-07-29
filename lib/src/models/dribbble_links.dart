/// The social media links for a User or Team
class DribbbleLinks {
  final String web;
  final String twitter;
  final String facebook;
  final String instagram;
  final String github;
  final String medium;
  final String codepen;
  final String behance;
  final String vimeo;

  DribbbleLinks(this.web, this.twitter, this.facebook, this.instagram,
      this.github, this.medium, this.codepen, this.behance, this.vimeo);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'web': web,
        'twitter': twitter,
        'facebook': facebook,
        'instagram': instagram,
        'github': github,
        'medium': medium,
        'codepen': codepen,
        'behance': behance,
        'vimeo': vimeo
      };

  factory DribbbleLinks.fromJson(Map<String, dynamic> json) =>
      new DribbbleLinks(
          json['web'] as String,
          json['twitter'] as String,
          json['facebook'] as String,
          json['instagram'] as String,
          json['github'] as String,
          json['medium'] as String,
          json['codepen'] as String,
          json['behance'] as String,
          json['vimeo'] as String);

  @override
  String toString() {
    return 'DribbbleLinks{web: $web, twitter: $twitter, facebook: $facebook, instagram: $instagram, github: $github, medium: $medium, codepen: $codepen, behance: $behance, vimeo: $vimeo}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleLinks &&
          runtimeType == other.runtimeType &&
          web == other.web &&
          twitter == other.twitter &&
          facebook == other.facebook &&
          instagram == other.instagram &&
          github == other.github &&
          medium == other.medium &&
          codepen == other.codepen &&
          behance == other.behance &&
          vimeo == other.vimeo;

  @override
  int get hashCode =>
      web.hashCode ^
      twitter.hashCode ^
      facebook.hashCode ^
      instagram.hashCode ^
      github.hashCode ^
      medium.hashCode ^
      codepen.hashCode ^
      behance.hashCode ^
      vimeo.hashCode;
}
