# Changelog

## [2.5.2](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.5.2) (2021-01-02)

This release uses CCU-Historian [2.5.2](https://github.com/mdzio/ccu-historian/releases/tag/2.5.2).

### Features

- Added support for multi-platform images. (#29)

## [2.5.1](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.5.1) (2020-10-12)

This release uses CCU-Historian [2.5.1](https://github.com/mdzio/ccu-historian/releases/tag/2.5.1).

### Features

- Added new environment variable `CONFIG_KEEP_MONTHS` to be able to cleanup old data. (#10)

### Improvements

- Exposed additional ports `8082` (Database Web-GUI Port), `9092` (Database TCP Port) and `5435` (Database PostgreSQL Port). (#13)

## [2.4.0](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.4.0) (2020-06-11)

This release uses CCU-Historian [2.4.0](https://github.com/mdzio/ccu-historian/releases/tag/2.4.0).

### Improvements

- Added Support for username and password environment variables. (#7)

## [2.3.0](https://github.com/x-jokay/docker-ccu-historian/releases/tag/2.3.0) (2019-11-09)

This release uses CCU-Historian [2.3.0](https://github.com/mdzio/ccu-historian/releases/tag/2.3.0).

## 2.2.2 (2019-10-06)

This release uses CCU-Historian [2.2.2](https://github.com/mdzio/ccu-historian/releases/tag/2.2.2).

## 2.2.1 (2019-09-27)

This release uses CCU-Historian [2.2.1](https://github.com/mdzio/ccu-historian/releases/tag/2.2.1).

## 2.2.0 (2019-09-03)

This release uses CCU-Historian [2.2.0](https://github.com/mdzio/ccu-historian/releases/tag/2.2.0).

### Improvements

- Added multi-stage build. (thx to @zsisamci)
- Added healthcheck.

### Bug fixes

- Fixed config file generation. (#3)
