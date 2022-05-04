# Changelog

## [3.0.2](https://github.com/jokay/docker-ccu-historian/releases/tag/3.0.2) (2022-05-04)

This release contains CCU-Historian [3.0.2](https://github.com/mdzio/ccu-historian/releases/tag/3.0.2).

## [3.0.1](https://github.com/jokay/docker-ccu-historian/releases/tag/3.0.1) (2022-05-01)

This release contains CCU-Historian [3.0.1](https://github.com/mdzio/ccu-historian/releases/tag/3.0.1).

### Breaking changes

A database migration for existing installations is required.

Please refer to the release notes of CCU-Historian [3.0.1](https://github.com/mdzio/ccu-historian/releases/tag/3.0.1)
on how to do an export and import via Web-UI before updating.

## [2.9.0](https://github.com/jokay/docker-ccu-historian/releases/tag/2.9.0) (2022-04-07)

This release contains CCU-Historian [2.9.0](https://github.com/mdzio/ccu-historian/releases/tag/2.9.0).

### Features

- Added new environment variable `CONFIG_MAINTENANCE` to be able to run the
  maintenance without removing old data. ([#140])
- Added new environment variable `CONFIG_JAVA_OPTS` to be able to set Java
  custom settings. ([#148])

## [2.8.3](https://github.com/jokay/docker-ccu-historian/releases/tag/2.8.3) (2022-01-08)

This release contains CCU-Historian [2.8.3](https://github.com/mdzio/ccu-historian/releases/tag/2.8.3).

## [2.8.1](https://github.com/jokay/docker-ccu-historian/releases/tag/2.8.1) (2021-12-19)

This release contains CCU-Historian [2.8.1](https://github.com/mdzio/ccu-historian/releases/tag/2.8.1).

## [2.8.0](https://github.com/jokay/docker-ccu-historian/releases/tag/2.8.0) (2021-12-06)

This release contains CCU-Historian [2.8.0](https://github.com/mdzio/ccu-historian/releases/tag/2.8.0).

## [2.7.1](https://github.com/jokay/docker-ccu-historian/releases/tag/2.7.1) (2021-11-06)

This release contains CCU-Historian [2.7.1](https://github.com/mdzio/ccu-historian/releases/tag/2.7.1).

## [2.7.0](https://github.com/jokay/docker-ccu-historian/releases/tag/2.7.0) (2021-09-19)

This release contains CCU-Historian [2.7.0](https://github.com/mdzio/ccu-historian/releases/tag/2.7.0).

## [2.6.0](https://github.com/jokay/docker-ccu-historian/releases/tag/2.6.0) (2021-03-19)

This release contains CCU-Historian [2.6.0](https://github.com/mdzio/ccu-historian/releases/tag/2.6.0).

## [2.5.3](https://github.com/jokay/docker-ccu-historian/releases/tag/2.5.3) (2021-01-21)

This release contains CCU-Historian [2.5.3](https://github.com/mdzio/ccu-historian/releases/tag/2.5.3).

## 2.5.2 (2021-01-10)

This release contained CCU-Historian [2.5.2](https://github.com/mdzio/ccu-historian/releases/tag/2.5.2).

### Features

- Added support for multi-platform images. ([#29])

## 2.5.1 (2020-10-12)

This release contained CCU-Historian [2.5.1](https://github.com/mdzio/ccu-historian/releases/tag/2.5.1).

### Features

- Added new environment variable `CONFIG_KEEP_MONTHS` to be able to cleanup old
data. ([#10])

### Improvements

- Exposed additional ports `8082` (Database Web-GUI Port), `9092` (Database TCP
Port) and `5435` (Database PostgreSQL Port). ([#13])

## 2.4.0 (2020-06-11)

This release contained CCU-Historian [2.4.0](https://github.com/mdzio/ccu-historian/releases/tag/2.4.0).

### Improvements

- Added Support for username and password environment variables. ([#7])

## 2.3.0 (2019-11-09)

This release contained CCU-Historian [2.3.0](https://github.com/mdzio/ccu-historian/releases/tag/2.3.0).

## 2.2.2 (2019-10-06)

This release contained CCU-Historian [2.2.2](https://github.com/mdzio/ccu-historian/releases/tag/2.2.2).

## 2.2.1 (2019-09-27)

This release contained CCU-Historian [2.2.1](https://github.com/mdzio/ccu-historian/releases/tag/2.2.1).

## 2.2.0 (2019-09-03)

This release contained CCU-Historian [2.2.0](https://github.com/mdzio/ccu-historian/releases/tag/2.2.0).

### Improvements

- Added multi-stage build. (thx to [@zsisamci](https://github.com/zsisamci))
- Added healthcheck.

### Bugfixes

- Fixed config file generation. ([#3])

[#3]: https://github.com/jokay/docker-ccu-historian/issues/3
[#7]: https://github.com/jokay/docker-ccu-historian/issues/7
[#10]: https://github.com/jokay/docker-ccu-historian/issues/10
[#13]: https://github.com/jokay/docker-ccu-historian/issues/13
[#29]: https://github.com/jokay/docker-ccu-historian/issues/29
[#140]: https://github.com/jokay/docker-ccu-historian/issues/140
[#148]: https://github.com/jokay/docker-ccu-historian/issues/148
