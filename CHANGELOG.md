[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

## [1.12.12](https://github.com/ibissource/zaakbrug/compare/v1.12.11...v1.12.12) (2023-06-16)


### 🔁 Continuous Integration

* breaking release parser opts fixed to allow for major releases ([#115](https://github.com/ibissource/zaakbrug/issues/115)) ([04744eb](https://github.com/ibissource/zaakbrug/commit/04744ebbeee84bdd72fe6e8d24a7c254aa73c899))

## [1.12.11](https://github.com/ibissource/zaakbrug/compare/v1.12.10...v1.12.11) (2023-06-08)


### 🧑‍💻 Code Refactoring

* improved feedback on uncaught errors ([280fdb3](https://github.com/ibissource/zaakbrug/commit/280fdb3dc1a96ce29b39b1fcf63920d802eca4a0))


### 🐛 Bug Fixes

* missing configuration for the organization in global config does not throw error ([cf3a7c9](https://github.com/ibissource/zaakbrug/commit/cf3a7c989ee6b36ce7ad6d28a82abd352603b6ea))

## [1.12.10](https://github.com/ibissource/zaakbrug/compare/v1.12.9...v1.12.10) (2023-06-06)


### 🐛 Bug Fixes

* **helm:** syntax error in zds timezone setting ([1b45651](https://github.com/ibissource/zaakbrug/commit/1b45651b0630e16a8145a6f7be07292eb61a3c2d))

## [1.12.9](https://github.com/ibissource/zaakbrug/compare/v1.12.8...v1.12.9) (2023-05-30)


### 🐛 Bug Fixes

* filter for beginGeldigheid on zaaktype does not include the current day ([#102](https://github.com/ibissource/zaakbrug/issues/102)) ([2c390bb](https://github.com/ibissource/zaakbrug/commit/2c390bb4bd8a9351e0bd10ad679e0c83cc274990))

## [1.12.8](https://github.com/ibissource/zaakbrug/compare/v1.12.7...v1.12.8) (2023-05-26)


### 🐛 Bug Fixes

* zds datetime from non-utc source defaults to zulu ([#100](https://github.com/ibissource/zaakbrug/issues/100)) ([6e2a7f0](https://github.com/ibissource/zaakbrug/commit/6e2a7f0ad2ab6e47f562f53e9c126d89e261f559))

## [1.12.7](https://github.com/ibissource/zaakbrug/compare/v1.12.6...v1.12.7) (2023-05-25)


### 🧑‍💻 Code Refactoring

* change attribute url to parameter url for better ladybug visibility ([#98](https://github.com/ibissource/zaakbrug/issues/98)) ([aafaf85](https://github.com/ibissource/zaakbrug/commit/aafaf85d05cf9e4741503c1f7a127aba56a33b3e))

## [1.12.6](https://github.com/ibissource/zaakbrug/compare/v1.12.5...v1.12.6) (2023-05-09)


### 🐛 Bug Fixes

* voegzaakdocumenttoe action with large documents takes very long or fails all together ([#95](https://github.com/ibissource/zaakbrug/issues/95)) ([ddb89ff](https://github.com/ibissource/zaakbrug/commit/ddb89ff7df2c34c90a62da0e2c046c8f5bbef170))

## [1.12.5](https://github.com/ibissource/zaakbrug/compare/v1.12.4...v1.12.5) (2023-05-09)


### ✅ Tests

* add test for passing large document to zaakbrug ([#93](https://github.com/ibissource/zaakbrug/issues/93)) ([098f874](https://github.com/ibissource/zaakbrug/commit/098f8742cbece991f34ba94c423ad3c5a7d37b36))

## [1.12.4](https://github.com/ibissource/zaakbrug/compare/v1.12.3...v1.12.4) (2023-05-01)


### ✅ Tests

* development test docker-compose expanded with openforms and cache openzaak ([#88](https://github.com/ibissource/zaakbrug/issues/88)) ([9135f8f](https://github.com/ibissource/zaakbrug/commit/9135f8f2057585ce9c84a9129ba9416b33ccc362))

## [1.12.3](https://github.com/ibissource/zaakbrug/compare/v1.12.2...v1.12.3) (2023-04-17)


### ✅ Tests

* add larva tests ([#86](https://github.com/ibissource/zaakbrug/issues/86)) ([ab6f583](https://github.com/ibissource/zaakbrug/commit/ab6f583521d91d075a70d6426639e7a2a574973b))

## [1.12.2](https://github.com/ibissource/zaakbrug/compare/v1.12.1...v1.12.2) (2023-04-17)


### 🐛 Bug Fixes

* propagate document formaat property correctly between zds to zgw and back ([#84](https://github.com/ibissource/zaakbrug/issues/84)) ([1fd510c](https://github.com/ibissource/zaakbrug/commit/1fd510cc2ed964bff128c6a1be09465c518a5840))

## [1.12.1](https://github.com/ibissource/zaakbrug/compare/v1.12.0...v1.12.1) (2023-04-12)


### 🐛 Bug Fixes

* make memory configurable to prevent OOM errors ([ea0bb75](https://github.com/ibissource/zaakbrug/commit/ea0bb75635fd987b461e18c23579407923c6a704))

## [1.12.0](https://github.com/ibissource/zaakbrug/compare/v1.11.4...v1.12.0) (2023-04-03)


### 🍕 Features

* add timezone to frank ([94106f7](https://github.com/ibissource/zaakbrug/commit/94106f71f47c2963320f5c185203d4c92392fac2))
* add tomcat users ([8e53ddb](https://github.com/ibissource/zaakbrug/commit/8e53ddb601d31f66ab43a28af712fc550de1db43))

## [1.11.4](https://github.com/ibissource/zaakbrug/compare/v1.11.3...v1.11.4) (2023-03-31)


### 🐛 Bug Fixes

* endpoints missing api name and api v1 in uri pattern ([ac54e5a](https://github.com/ibissource/zaakbrug/commit/ac54e5a4fd9cb72c50ad50b0e257f592142a94ab))
* zgw endpoints return invalid json ([bdaa642](https://github.com/ibissource/zaakbrug/commit/bdaa642b44d34b92ab06af20f01fed6ee7aa5b13))


### 🧑‍💻 Code Refactoring

* exit path rename to name ([bee9875](https://github.com/ibissource/zaakbrug/commit/bee9875cfde07596ac002009f7a5056074b96992))
* suppress ff defaults warnings for zgw apis ([3075a6a](https://github.com/ibissource/zaakbrug/commit/3075a6afdca468d2fb3b2549ac8b712aff3185a7))

## [1.11.3](https://github.com/ibissource/zaakbrug/compare/v1.11.2...v1.11.3) (2023-03-22)


### 🐛 Bug Fixes

* make the frank able to run in readOnly mode ([#73](https://github.com/ibissource/zaakbrug/issues/73)) ([20def24](https://github.com/ibissource/zaakbrug/commit/20def241805f0523bba4493b155210fce7b4bcfb))

## [1.11.2](https://github.com/ibissource/zaakbrug/compare/v1.11.1...v1.11.2) (2023-03-22)


### 🧑‍💻 Code Refactoring

* scaffold zgw api endpoints behind feature toggle ([#72](https://github.com/ibissource/zaakbrug/issues/72)) ([a584345](https://github.com/ibissource/zaakbrug/commit/a584345af48ee3607867a36a6c10aa44e73ce0d4))

## [1.11.1](https://github.com/ibissource/zaakbrug/compare/v1.11.0...v1.11.1) (2023-03-22)


### 🐛 Bug Fixes

* when url uses a standard port omit it in host header ([#71](https://github.com/ibissource/zaakbrug/issues/71)) ([be50dea](https://github.com/ibissource/zaakbrug/commit/be50deadbe8187c880d73554c023794ab40d6b36))

## [1.11.0](https://github.com/ibissource/zaakbrug/compare/v1.10.1...v1.11.0) (2023-03-15)


### 🍕 Features

* basic and static value authorization methods for zgw api communication ([#69](https://github.com/ibissource/zaakbrug/issues/69)) ([6ec7e4d](https://github.com/ibissource/zaakbrug/commit/6ec7e4d96dd8af5d80005d216d0e6ace8d7232f8))

## [1.10.1](https://github.com/ibissource/zaakbrug/compare/v1.10.0...v1.10.1) (2023-03-15)


### 🐛 Bug Fixes

* boolean to string conversion in helm chart ([#67](https://github.com/ibissource/zaakbrug/issues/67)) ([a5f7fac](https://github.com/ibissource/zaakbrug/commit/a5f7fac96e3bf3fc15da8d23e8ead96dbf3b60e6))

## [1.10.0](https://github.com/ibissource/zaakbrug/compare/v1.9.0...v1.10.0) (2023-03-15)


### 🍕 Features

* License ([#68](https://github.com/ibissource/zaakbrug/issues/68)) ([0a6485f](https://github.com/ibissource/zaakbrug/commit/0a6485fdacf51ad2581d24cb05e79c14af1d4f64))

## [1.9.0](https://github.com/ibissource/zaakbrug/compare/v1.8.0...v1.9.0) (2023-03-14)


### 🍕 Features

* Refine Ladybug status column ([#65](https://github.com/ibissource/zaakbrug/issues/65)) ([8a5082c](https://github.com/ibissource/zaakbrug/commit/8a5082cc43fa9a4533b32d70456e4814850bf8ec))
* Refine Ladybug status column ([#65](https://github.com/ibissource/zaakbrug/issues/65)) ([e25404c](https://github.com/ibissource/zaakbrug/commit/e25404ca7521bbd6f0376fb53b50a46aa7494ce4))

## [1.8.0](https://github.com/ibissource/zaakbrug/compare/v1.7.0...v1.8.0) (2023-03-14)


### 🍕 Features

* configurable template strings for interpolating variables for identificatie generation ([#43](https://github.com/ibissource/zaakbrug/issues/43)) ([4aa3041](https://github.com/ibissource/zaakbrug/commit/4aa304134912d9218b554f751d7de5058e3c2674))

## [1.7.0](https://github.com/ibissource/zaakbrug/compare/v1.6.1...v1.7.0) (2023-03-13)


### 🍕 Features

* Add soap action to ladybug table ([#64](https://github.com/ibissource/zaakbrug/issues/64)) ([f2191e4](https://github.com/ibissource/zaakbrug/commit/f2191e459fa5529c287d336220b7c89dbb0e2872))

## [1.6.1](https://github.com/ibissource/zaakbrug/compare/v1.6.0...v1.6.1) (2023-03-10)


### 🐛 Bug Fixes

* catch and propagate errors from API calls to soap fault responses ([#62](https://github.com/ibissource/zaakbrug/issues/62)) ([caa6e94](https://github.com/ibissource/zaakbrug/commit/caa6e940d2d35b25b448ceee4e27d742c78d310f))

## [1.6.0](https://github.com/ibissource/zaakbrug/compare/v1.5.4...v1.6.0) (2023-03-02)


### 🍕 Features

* Seperate configuration of properties and JWT credentials for each ZGW API ([#57](https://github.com/ibissource/zaakbrug/issues/57)) ([6c5bee1](https://github.com/ibissource/zaakbrug/commit/6c5bee195be5e0bede053497837f0b36de1617f6))

## [1.5.4](https://github.com/ibissource/zaakbrug/compare/v1.5.3...v1.5.4) (2023-02-24)


### 🐛 Bug Fixes

* throw errors on failed localsender and httpsender calls ([#56](https://github.com/ibissource/zaakbrug/issues/56)) ([ef5284a](https://github.com/ibissource/zaakbrug/commit/ef5284a8496c3c3f6560e6da7bd3e2386d7786a1))

## [1.5.3](https://github.com/ibissource/zaakbrug/compare/v1.5.2...v1.5.3) (2023-02-23)


### 🐛 Bug Fixes

* Add missing celery requirement to dev docker-compose ([#54](https://github.com/ibissource/zaakbrug/issues/54)) ([8c6cf91](https://github.com/ibissource/zaakbrug/commit/8c6cf919ac2cd13ad68db85c65f80d78ffc84c66))

## [1.5.2](https://github.com/ibissource/zaakbrug/compare/v1.5.1...v1.5.2) (2023-02-21)


### 🐛 Bug Fixes

* skip json to xml when already xml ([#53](https://github.com/ibissource/zaakbrug/issues/53)) ([a665e21](https://github.com/ibissource/zaakbrug/commit/a665e2112030d5bed04cb4b1f730d2033e93ddac))

## [1.5.1](https://github.com/ibissource/zaakbrug/compare/v1.5.0...v1.5.1) (2023-02-21)


### 🐛 Bug Fixes

* skip status update when omschrijving not found ([#52](https://github.com/ibissource/zaakbrug/issues/52)) ([7b687b2](https://github.com/ibissource/zaakbrug/commit/7b687b2a68f4338f1e7769cf9aa89d5c291bb8de))

## [1.5.0](https://github.com/ibissource/zaakbrug/compare/v1.4.1...v1.5.0) (2023-02-20)


### 🍕 Features

* add SoftFail to ActualiseerZaakstatus and VoegZaakdocumentToe ([#51](https://github.com/ibissource/zaakbrug/issues/51)) ([af8468e](https://github.com/ibissource/zaakbrug/commit/af8468e54312c0188b9e0becc6eac57f893eb17f))

## [1.4.1](https://github.com/ibissource/zaakbrug/compare/v1.4.0...v1.4.1) (2023-02-16)


### 🐛 Bug Fixes

* Documenten inhoud attributess not copied to reponse ([af8e70a](https://github.com/ibissource/zaakbrug/commit/af8e70a3ea1659132da46849bc6c109c2db9acc1))
* Generate plain base64 instead of 76 per line ([48de836](https://github.com/ibissource/zaakbrug/commit/48de836542c28eaa883857191dc96afd05f5dc4b))
* Include document content&meta on getters ([c53dac9](https://github.com/ibissource/zaakbrug/commit/c53dac9570604bdb13862976c8d404c628047826))
* Propogate attributes on inhoud in Du02 response ([56549c4](https://github.com/ibissource/zaakbrug/commit/56549c44629d65bc961abe5d815e810b40add76a))
* Skip documenten bestandsomvang instead of null ([c048dea](https://github.com/ibissource/zaakbrug/commit/c048dea4ece9c1b526a9a2589062031f60c1062e))

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
