![CD](https://github.com/whitelabelco/expo-cli-images/workflows/CD/badge.svg)

# Expo for Docker

A prebuilt docker image for [Expo CLI][link-cli] on Docker-based environments.
This image contains all necessary libraries to perform all commands of the CLI.
To make sure this image stays up to date, CI is scheduled to run daily builds.

## Supported versions

image                 | node  | expo  | status
---                   | ---   | ---   | ---
`whitelabelco/expo-cli:3` | `12`  | `3`   | **latest**

> Only version 3 is daily rebuilt.

## What's inside?

The entry point of this image forwards to the [Expo CLI][link-cli].
It automatically authenticates when both `EXPO_CLI_USERNAME` and `EXPO_CLI_PASSWORD` are defined.
When these environment variables are undefined, it skips this step and forwards the command directly to Expo.

## How to use it?

Usage of this image is relatively simple.

> This image is intended to use on Docker-based CI environments, see [the Expo CI guide][link-docs] to get started.

```bash
# run expo cli and check the cli version
$ docker run -t whitelabelco/expo-cli --version
$ docker run -t whitelabelco/expo-cli diagnostics

# or use bash to interact with the cli manually
$ docker run -ti whitelabelco/expo-cli bash

# perform authenticated expo commands directly
$ docker run \
    --tty \
    --env EXPO_CLI_USERNAME=whitelabelco \
    --env EXPO_CLI_PASSWORD=mypass \
    whitelabelco/expo-cli publish

# mount your project as volume and use the cli manually
$ docker run \
    --tty \
    --interactive \
    --workdir /code \
    --volume $PWD:/code \
    --env EXPO_CLI_USERNAME=whitelabelco \
    --env EXPO_CLI_PASSWORD=mypass \
    whitelabelco/expo-cli bash
```

## Build your version

You can use this image to build a custom version of both node and expo-cli.
It accepts both `NODE_VERSION` and `EXPO_VERSION` as build arguments.

```bash
# create a node 10 and expo cli 2 image
$ docker build . \
    --build-arg NODE_VERSION=10 \
    --build-arg EXPO_VERSION=2 \
    --tag awsomeorg/expo-cli
```

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[link-cli]: https://docs.expo.io/versions/latest/workflow/expo-cli
[link-docs]: https://docs.expo.io/versions/latest/guides/setting-up-continuous-integration
