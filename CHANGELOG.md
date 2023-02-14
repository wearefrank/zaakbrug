[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

## [1.4.0](https://github.com/ibissource/zaakbrug/compare/v1.3.0...v1.4.0) (2023-02-14)


### 🍕 Features

* Configurable soft-fail on SOAP endpoints ([191c2db](https://github.com/ibissource/zaakbrug/commit/191c2db77e1a962ab117e250130a374d00716bf3))
* **helm:** SOAP endpoint section added to Helm ([38dda3c](https://github.com/ibissource/zaakbrug/commit/38dda3ce65cd492d4fa1d7c19cfccddf6b894d2c))


### 🐛 Bug Fixes

* Fix pipe fallthrough in soap endpoints ([812a0b0](https://github.com/ibissource/zaakbrug/commit/812a0b0e25ebb9fd41d1ca7502c2ee50fa033c57))
* **helm:** Unused baseurl removed in soap section ([3849242](https://github.com/ibissource/zaakbrug/commit/384924237f0fb66151ebe042b94ba77ab59cd109))


### 🧑‍💻 Code Refactoring

* Renamed SOAP endpoint property names ([d36ed17](https://github.com/ibissource/zaakbrug/commit/d36ed1798a681d5caea7ec26d385bbf47ddcc5ae))
* Soap endpoints naming inconsistency fix ([c3fbdfb](https://github.com/ibissource/zaakbrug/commit/c3fbdfba6064696a56afa3f5d3b4cc524e2264a0))

## [1.3.0](https://github.com/ibissource/zaakbrug/compare/v1.2.2...v1.3.0) (2023-02-10)


### 🍕 Features

* add support for AD and add property for https ([#37](https://github.com/ibissource/zaakbrug/issues/37)) ([6cbff4d](https://github.com/ibissource/zaakbrug/commit/6cbff4d700c87a8a756b39e9b7dd5ffdc093fd32))

## [1.2.2](https://github.com/ibissource/zaakbrug/compare/v1.2.1...v1.2.2) (2023-02-03)


### 🐛 Bug Fixes

* **docker:** :wrench: Configure OpenZaak in development docker-compose to rewrite host to localhost ([c2cd3af](https://github.com/ibissource/zaakbrug/commit/c2cd3aff90f5fc03f7ba1be73a333a97531f047b))

## [1.2.1](https://github.com/ibissource/zaakbrug/compare/v1.2.0...v1.2.1) (2023-02-03)


### 🐛 Bug Fixes

* **docker:** :wrench: Add name of database in default Docker context.xml for placement in data sufolder ([970c2d4](https://github.com/ibissource/zaakbrug/commit/970c2d4f7cf2f9f296459bd2746aab9c864f793f))
* **docker:** :wrench: Mount default database subfolder in docker-compose by default ([175759c](https://github.com/ibissource/zaakbrug/commit/175759c4fefb7ae7b74aed555b0c096aa903a9cc))

## [1.2.0](https://github.com/ibissource/zaakbrug/compare/v1.1.0...v1.2.0) (2023-02-03)


### 🍕 Features

* Make it possible to configure "Globals" and "Profiles" directly from within the values.yaml ([#24](https://github.com/ibissource/zaakbrug/issues/24)) ([f0b7034](https://github.com/ibissource/zaakbrug/commit/f0b70346e17536a432daaaa85f10ef5c09c916f2))

## [1.1.0](https://github.com/ibissource/zaakbrug/compare/v1.0.4...v1.1.0) (2023-02-02)


### 🍕 Features

* update helm chart and add installation instructions for jwt ([#22](https://github.com/ibissource/zaakbrug/issues/22)) ([bd6519c](https://github.com/ibissource/zaakbrug/commit/bd6519c66646594fe4f43bca11de84c28a228611))

## [1.0.4](https://github.com/ibissource/zaakbrug/compare/v1.0.3...v1.0.4) (2023-02-02)


### 🧑‍💻 Code Refactoring

* remove maven file structure and make it user friendly ([5fad1dc](https://github.com/ibissource/zaakbrug/commit/5fad1dcacc279d6c52b500a0890e1c4bdd2359a8))


### ⏩ Reverts

* use Maven project structure ([1d859de](https://github.com/ibissource/zaakbrug/commit/1d859ded536a53ac4d129ebb2d31beb629c0b4cd))


### 🐛 Bug Fixes

* credentials in the docker file ([41863f3](https://github.com/ibissource/zaakbrug/commit/41863f3a596c20d48a255ae662f704227b72550a))
* deployment specifics merge conflict ([b3adf59](https://github.com/ibissource/zaakbrug/commit/b3adf5942f037be049c76da04aea69f3d8bcbf52))
* process feedback on pull-request ([f4c1f00](https://github.com/ibissource/zaakbrug/commit/f4c1f000caa0c59db15c440c0515ed8da00276b6))

## [1.0.3](https://github.com/ibissource/zaakbrug/compare/v1.0.2...v1.0.3) (2023-02-01)


### 🔁 Continuous Integration

* **github:** Enable upload to security dashboard ([7e5439d](https://github.com/ibissource/zaakbrug/commit/7e5439d808ed7c6c6c0216222f6311583151b280))

## [1.0.2](https://github.com/ibissource/zaakbrug/compare/v1.0.1...v1.0.2) (2023-02-01)


### 🔁 Continuous Integration

* **github:** Set checkout token ([2eeb057](https://github.com/ibissource/zaakbrug/commit/2eeb0578696655f7f007bb462fe9523dca8a3f6c))
