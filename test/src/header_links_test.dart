import 'package:test/test.dart';
import 'package:dribbble_client/dribbble_client.dart';

void main() {
  group('Link Headers', () {
    test('can be parse next & prev links', () {
      final nextPrev =
          '<https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=3>; rel="next", <https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=1>; rel="prev"';
      final header = new DribbbleHeaderLinks.parse(nextPrev);

      expect(header.nextLink,
          'https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=3');
      expect(header.prevLink,
          'https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=1');
    });

    test('can be parse next links without a prev link', () {
      final next =
          '<https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=2>; rel="next"';
      final header = new DribbbleHeaderLinks.parse(next);

      expect(header.nextLink,
          'https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=2');
      expect(header.prevLink, "");
    });

    test('can be parse prev links without a next link', () {
      final prev =
          '<https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=1>; rel="prev"';
      final header = new DribbbleHeaderLinks.parse(prev);

      expect(header.nextLink, '');
      expect(header.prevLink,
          'https://api.dribbble.com/v1/shots?access_token=bc94df476c7d5a1dc0744210d8edf6572c7d70e0d3efa9e79915f8f6dd9de35e&page=1');
    });

    test('sane defaults if an empty string is provided', () {
      final header = new DribbbleHeaderLinks.parse('');

      expect(header.nextLink, '');
      expect(header.prevLink, '');
    });

    test('sane defaults if null is provided', () {
      final header = new DribbbleHeaderLinks.parse(null);

      expect(header.nextLink, '');
      expect(header.prevLink, '');
    });
  });
}
