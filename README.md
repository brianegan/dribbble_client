# dribbble_api

[![build status](https://gitlab.com/brianegan/dribbble_client/badges/master/build.svg)](https://gitlab.com/brianegan/dribbble_client/commits/master)  [![coverage report](https://gitlab.com/brianegan/dribbble_client/badges/master/coverage.svg)](https://brianegan.gitlab.io/dribbble_client/coverage/)

A library for interacting with the [Dribbble Api](http://developer.dribbble.com/v1/).

## Usage

  1. [Register a new app](https://dribbble.com/account/applications) with Dribble
  2. Obtain your `access_token`
  3. Install the `dribbble_client:` dependency in your project's `pubspec.yaml`
  4. Create a new `DribbbleClient`: `final client = new DribbbleClient("YOUR_ACCESS_TOKEN");`
  5. Profit: `final shots = client.fetchPopularShots(pageSize: 50)`

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://gitlab.com/brianegan/dribbble_client/issues).
