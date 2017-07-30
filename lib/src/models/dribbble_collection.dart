/// A List<Model> (Shots, Users, etc) with next and prev pagination baked in.
class DribbbleCollection<T> {
  final List<T> collection;
  final String nextLink;
  final String prevLink;

  DribbbleCollection(this.collection, this.nextLink, this.prevLink);

  bool get hasNext => nextLink != null && nextLink.isNotEmpty;

  bool get hasPrev => prevLink != null && prevLink.isNotEmpty;

  static DribbbleCollection fromHeader<T>(
      List<T> collection, String linkHeader) {
    final links = new DribbbleHeaderLinks.parse(linkHeader);

    return new DribbbleCollection(collection, links.nextLink, links.prevLink);
  }

  @override
  String toString() {
    return 'DribbbleCollection{collection: $collection, nextLink: $nextLink, prevLink: $prevLink}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DribbbleCollection &&
          runtimeType == other.runtimeType &&
          collection == other.collection &&
          nextLink == other.nextLink &&
          prevLink == other.prevLink;

  @override
  int get hashCode =>
      collection.hashCode ^ nextLink.hashCode ^ prevLink.hashCode;
}

/// A utility class for parsing the next and prev links from Dribbble's HTTP
/// headers.
class DribbbleHeaderLinks {
  final String nextLink;
  final String prevLink;

  DribbbleHeaderLinks(this.nextLink, this.prevLink);

  factory DribbbleHeaderLinks.parse(String linkHeader) {
    final links = (linkHeader ?? '').split(',');

    return new DribbbleHeaderLinks(
        _extractLink(links, "next"), _extractLink(links, "prev"));
  }

  static String _extractLink(List<String> links, String type) => links
      .firstWhere(
        (link) => link.contains('rel="$type"'),
        orElse: () => "",
      )
      .replaceAll(new RegExp('<|>; rel="$type"'), '')
      .trim();
}
