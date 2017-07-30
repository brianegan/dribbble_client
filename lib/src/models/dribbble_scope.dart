enum DribbbleScope { public, write, comment, upload }

DribbbleScope getScopeFromString(String scopeAsString) {
  for (DribbbleScope element in DribbbleScope.values) {
    if (element.toString().contains(scopeAsString)) {
      return element;
    }
  }
  return null;
}