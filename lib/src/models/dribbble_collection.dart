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
}

/// A utility class for parsing the next and prev links from Dribbble's HTTP
/// headers.
class DribbbleHeaderLinks {
  final String nextLink;
  final String prevLink;

  DribbbleHeaderLinks(this.nextLink, this.prevLink);

  factory DribbbleHeaderLinks.parse(String linkHeader) {
    final links = (linkHeader ?? '').split(',');

    final nextLink = links
        .firstWhere(
          (link) => link.contains('rel="next"'),
          orElse: () => "",
        )
        .replaceAll('<', '')
        .replaceAll('>; rel="next"', '')
        .trim();

    final prevLink = links
        .firstWhere(
          (link) => link.contains('rel="prev"'),
          orElse: () => "",
        )
        .replaceAll('<', '')
        .replaceAll('>; rel="prev"', '')
        .trim();

    return new DribbbleHeaderLinks(nextLink, prevLink);
  }
}
