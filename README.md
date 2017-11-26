# dribbble_client

[![Build Status](https://travis-ci.org/brianegan/dribbble_client.svg?branch=master)](https://travis-ci.org/brianegan/dribbble_client) [![codecov](https://codecov.io/gh/brianegan/dribbble_client/branch/master/graph/badge.svg)](https://codecov.io/gh/brianegan/dribbble_client)

A library for interacting with the [Dribbble Api](http://developer.dribbble.com/v1/).

## Usage

  1. [Register a new app](https://dribbble.com/account/applications) with Dribble
  2. Obtain your `access_token`
  3. Install the `dribbble_client:` dependency in your project's `pubspec.yaml`
  4. Create a new `DribbbleClient`: `final client = new DribbbleClient("YOUR_ACCESS_TOKEN");`
  5. Profit: `final shots = client.fetchPopularShots(pageSize: 50)`

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/brianegan/dribbble_client/issues).
