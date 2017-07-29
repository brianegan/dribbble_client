/// The Image Sizes available for each Shot
class DribbbleImages {
  final String hiDpi;
  final String normal;
  final String teaser;

  DribbbleImages(this.hiDpi, this.normal, this.teaser);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'hidpi': hiDpi, 'normal': normal, 'teaser': teaser};

  factory DribbbleImages.fromJson(Map<String, dynamic> json) =>
      new DribbbleImages(json['hidpi'] as String, json['normal'] as String,
          json['teaser'] as String);

  @override
  String toString() {
    return 'DribbbleImages{hiDpi: $hiDpi, normal: $normal, teaser: $teaser}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleImages &&
          runtimeType == other.runtimeType &&
          hiDpi == other.hiDpi &&
          normal == other.normal &&
          teaser == other.teaser;

  @override
  int get hashCode => hiDpi.hashCode ^ normal.hashCode ^ teaser.hashCode;
}
