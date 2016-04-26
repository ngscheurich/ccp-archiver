# CCP Archiver

[![Build Status](https://circleci.com/gh/ngscheurich/ccp-archiver.svg?&style=shield)](https://circleci.com/gh/ngscheurich/ccp-archiver)
[![Code Coverage](https://codecov.io/github/ngscheurich/ccp-archiver/coverage.svg?branch=master)](https://codecov.io/github/ngscheurich/ccp-archiver?branch=master)

The CCP Archiver is a tool I built to extract all of the content from [The Advocate](http://theadvocate.com)’s CMS, store it in a safe place, and transform it to meet the import requirements of a new CMS.

![Screenshot](https://raw.githubusercontent.com/ngscheurich/ccp-archiver/master/screenshot.png)

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
