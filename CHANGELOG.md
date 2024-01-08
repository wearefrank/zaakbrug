[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

## [1.14.1](https://github.com/wearefrank/zaakbrug/compare/v1.14.0...v1.14.1) (2024-01-08)


### 🤖 Build System

* append user JAVA_OPTS to end of application JAVA_OPTS ([#254](https://github.com/wearefrank/zaakbrug/issues/254)) ([9538af7](https://github.com/wearefrank/zaakbrug/commit/9538af7ba941346ceb05fc3595af77ad2b39141f))

## [1.14.0](https://github.com/wearefrank/zaakbrug/compare/v1.13.40...v1.14.0) (2024-01-02)


### 🍕 Features

* implement translation for zds rol gerelateerde organisatorische eenheid to zgw rol betrokkenetype ([#239](https://github.com/wearefrank/zaakbrug/issues/239)) ([c265068](https://github.com/wearefrank/zaakbrug/commit/c2650684da32916306b55789899091359d1498a8))

## [1.13.40](https://github.com/wearefrank/zaakbrug/compare/v1.13.39...v1.13.40) (2024-01-02)


### 🤖 Build System

* remove ConcGCThreads override causing threadcount error on low cpu-limit environments ([33fc4e9](https://github.com/wearefrank/zaakbrug/commit/33fc4e93533d9bbd58a189354207aa187bad3fcb))

## [1.13.39](https://github.com/wearefrank/zaakbrug/compare/v1.13.38...v1.13.39) (2023-12-22)


### 🐛 Bug Fixes

* default log.level to INFO instead of DEBUG due to performance ([2aabbc5](https://github.com/wearefrank/zaakbrug/commit/2aabbc50d691f694c011585a4d2c463243c2a8d8))
* disable prometheus endpoint to stop metrics building up in memory ([46ee4e2](https://github.com/wearefrank/zaakbrug/commit/46ee4e2299626de6a2594b18a6271d824384f272))


### ✅ Tests

* changed JAVA_OPTS to add to exiting instead of replace in zaakbrug docker-compose ([eded492](https://github.com/wearefrank/zaakbrug/commit/eded49279bdf42b453379285751e34834042fbcf))


### 🤖 Build System

* add GC_LOGGING_ENABLED environment variable to enabled trace level gc logs ([bf69134](https://github.com/wearefrank/zaakbrug/commit/bf691340a75b58f45b124114eaa1681cfc4f5496))
* disable zds 1.2 soap-endpoints to reduce static memory usage ([1cff562](https://github.com/wearefrank/zaakbrug/commit/1cff5620766b6178f51e95b9aa3cc3cb30ae087d))
* garbage collector tuning to increase stability with large document processing ([e5c8c26](https://github.com/wearefrank/zaakbrug/commit/e5c8c2631b9e5ba5ca9029e1b00e0f89f7afcbf0))

## [1.13.38](https://github.com/wearefrank/zaakbrug/compare/v1.13.37...v1.13.38) (2023-12-22)


### 🐛 Bug Fixes

* increase max number of checkpoints increased to 5000 ([#242](https://github.com/wearefrank/zaakbrug/issues/242)) ([6b19867](https://github.com/wearefrank/zaakbrug/commit/6b198679cec54fe445e7e4c2b53e5e817d4429f2))

## [1.13.37](https://github.com/wearefrank/zaakbrug/compare/v1.13.36...v1.13.37) (2023-12-22)


### 🐛 Bug Fixes

* verlenging with empty reason or duur of zero should be ignored ([45f16e5](https://github.com/wearefrank/zaakbrug/commit/45f16e5bd2eaf0293404347f09a95ea099ba2825))


### ✅ Tests

* add verlenging testcases and fix for equal datumstatusgezet status testcase ([1acb7d2](https://github.com/wearefrank/zaakbrug/commit/1acb7d2eac89b45712c4c98b7510c00af3c8a4bb))

## [1.13.36](https://github.com/wearefrank/zaakbrug/compare/v1.13.35...v1.13.36) (2023-12-19)


### ✅ Tests

* add jmx config and port to compose for debugging heapsize ([#240](https://github.com/wearefrank/zaakbrug/issues/240)) ([04fa0ee](https://github.com/wearefrank/zaakbrug/commit/04fa0ee09ed7b4f3eeea1cff896f8c7961f91873))

## [1.13.35](https://github.com/wearefrank/zaakbrug/compare/v1.13.34...v1.13.35) (2023-12-15)


### 🐛 Bug Fixes

* add execution permissions to entrypoint script ([eea7859](https://github.com/wearefrank/zaakbrug/commit/eea78592178522ee224ff3dc650b3c598e4adf28))


### 🔥 Performance Improvements

* fix bottleneck with large documents during read actions ([0769940](https://github.com/wearefrank/zaakbrug/commit/076994079557790dd540465fc46e34c1d87ba2c3))


### ⏩ Reverts

* revert "build(dependencies): bump f!f version to 8.0-20231123.223429 (#203)" ([98180d2](https://github.com/wearefrank/zaakbrug/commit/98180d2514b55865d4246a497f422033ce497a00)), closes [#203](https://github.com/wearefrank/zaakbrug/issues/203)


### ✅ Tests

* add InitialRAMPercentatage and MaxRAMPercentage to zaakbrug ([9dd925f](https://github.com/wearefrank/zaakbrug/commit/9dd925f89bc37eb9434dff8314befefa0a66bece))


### 🤖 Build System

* add docker entrypoint with heapdump java_opts ([fdf600e](https://github.com/wearefrank/zaakbrug/commit/fdf600ee617330ab268be373524ad52c29dbdfdf))
* add jvm settings and flags dump on zaakbrug startup ([24b83ba](https://github.com/wearefrank/zaakbrug/commit/24b83ba0f068ad0c5f0d2812d604982a37513567))
* replace jre11 with jdk11 for debugging and profiling tooling ([218442d](https://github.com/wearefrank/zaakbrug/commit/218442d0c6a6b26ac60bc90b5291dcce43e22160))
* switch to better suited G1GC garbarge collector ([23c7963](https://github.com/wearefrank/zaakbrug/commit/23c7963cbec6ab99cfa45ce787eec9540ffce5ad))

## [1.13.34](https://github.com/wearefrank/zaakbrug/compare/v1.13.33...v1.13.34) (2023-12-11)


### 🔁 Continuous Integration

* change api url to html url for issues link ([#233](https://github.com/wearefrank/zaakbrug/issues/233)) ([ad5129c](https://github.com/wearefrank/zaakbrug/commit/ad5129cd28a58b9d45208c2c06602f2f3f761b5c))

## [1.13.33](https://github.com/wearefrank/zaakbrug/compare/v1.13.32...v1.13.33) (2023-12-07)


### 🔁 Continuous Integration

* prevent exploit usage on jira action ([#230](https://github.com/wearefrank/zaakbrug/issues/230)) ([c60abba](https://github.com/wearefrank/zaakbrug/commit/c60abbaded843120f60b7be0616e5060340e97f0))

## [1.13.32](https://github.com/wearefrank/zaakbrug/compare/v1.13.31...v1.13.32) (2023-12-05)


### 🤖 Build System

* **dependencies:** bump f!f version to 8.0-20231123.223429 ([#203](https://github.com/wearefrank/zaakbrug/issues/203)) ([f434dfb](https://github.com/wearefrank/zaakbrug/commit/f434dfbc9522ceff4504a5a0d1ea768b564beac2))

## [1.13.31](https://github.com/wearefrank/zaakbrug/compare/v1.13.30...v1.13.31) (2023-12-05)


### 🐛 Bug Fixes

* missing error feedback when adding a new status fails ([#228](https://github.com/wearefrank/zaakbrug/issues/228)) ([e1a1f01](https://github.com/wearefrank/zaakbrug/commit/e1a1f017ac0684c96a75748a638d112ab5b1f41d))

## [1.13.30](https://github.com/wearefrank/zaakbrug/compare/v1.13.29...v1.13.30) (2023-12-05)


### 🐛 Bug Fixes

* missing error feedback when adding a new status fails that has datumstatusgezet exactly equal to an existing status ([#216](https://github.com/wearefrank/zaakbrug/issues/216)) ([1a90839](https://github.com/wearefrank/zaakbrug/commit/1a90839c1c7803d891b7b73de44c245ff2078e72))

## [1.13.29](https://github.com/wearefrank/zaakbrug/compare/v1.13.28...v1.13.29) (2023-12-04)


### 🔁 Continuous Integration

* **dependencies:** bump jira create and login to latest commit tag ([#227](https://github.com/wearefrank/zaakbrug/issues/227)) ([b6724c2](https://github.com/wearefrank/zaakbrug/commit/b6724c226cba75f681e2e8d81a7165e327d624b7))

## [1.13.28](https://github.com/wearefrank/zaakbrug/compare/v1.13.27...v1.13.28) (2023-12-04)


### 🔁 Continuous Integration

* rename jiraCreateIssue to jiraCreateIssue.yml ([#225](https://github.com/wearefrank/zaakbrug/issues/225)) ([b738f67](https://github.com/wearefrank/zaakbrug/commit/b738f67afcf83735c10c952fcebc1d8d5333a7a7))

## [1.13.27](https://github.com/wearefrank/zaakbrug/compare/v1.13.26...v1.13.27) (2023-12-01)


### 🐛 Bug Fixes

* missing error feedback when no roltype with matching omschrijving is found in AddRolToZgw adapter ([#211](https://github.com/wearefrank/zaakbrug/issues/211)) ([356773c](https://github.com/wearefrank/zaakbrug/commit/356773c487c98f87eb21fec77978bc97fbf5d085))

## [1.13.26](https://github.com/wearefrank/zaakbrug/compare/v1.13.25...v1.13.26) (2023-12-01)


### 🔁 Continuous Integration

* update jiraCreateIssue to full sha ([#223](https://github.com/wearefrank/zaakbrug/issues/223)) ([4122d5f](https://github.com/wearefrank/zaakbrug/commit/4122d5f853e2d4a096535dbb71a1f9b6ba6993b2))

## [1.13.25](https://github.com/wearefrank/zaakbrug/compare/v1.13.24...v1.13.25) (2023-12-01)


### 🐛 Bug Fixes

* missing error feedback when GetZaakByIdentificatie succeeds but no zaak with the given identificatie is found in geefLijstZaakDocumenten ([#212](https://github.com/wearefrank/zaakbrug/issues/212)) ([8130c68](https://github.com/wearefrank/zaakbrug/commit/8130c685c03583801acf998796b993f64484584e))

## [1.13.24](https://github.com/wearefrank/zaakbrug/compare/v1.13.23...v1.13.24) (2023-11-30)


### 🐛 Bug Fixes

* updateZaakdocument error when translating taal when only the new object state sent ([#217](https://github.com/wearefrank/zaakbrug/issues/217)) ([6e8b847](https://github.com/wearefrank/zaakbrug/commit/6e8b847bb6176c74a237f1f49d10a15fbc2dbd0f))

## [1.13.23](https://github.com/wearefrank/zaakbrug/compare/v1.13.22...v1.13.23) (2023-11-30)


### 🐛 Bug Fixes

* empty geboortedatum under gerelateerde nps causes xslt error ([13398e8](https://github.com/wearefrank/zaakbrug/commit/13398e851602ddcd89534b3f12c19c3624285d3d))
* geboortedatum under gerelateerde nps incorrectly translates to zgw date format ([1902ec0](https://github.com/wearefrank/zaakbrug/commit/1902ec0e10647614d6b574f2d657149e2d75bca5))
* inn.rechtsvorm name typo causes invalid geefZaakDetails response ([c014ae5](https://github.com/wearefrank/zaakbrug/commit/c014ae5c2d36d19ec5e9e8eedab1e436d4f35591))
* updateZaak incorrectly detects new changed or delete roles ([789d696](https://github.com/wearefrank/zaakbrug/commit/789d69691574ba62622db847790dc3f159a61c3e))
* updateZaak wrongly translates heefBetrekkingOp adres as rol ([d8e1362](https://github.com/wearefrank/zaakbrug/commit/d8e1362196dc9cc0aa4bd8e05b833cb41a6c4c48))

## [1.13.22](https://github.com/wearefrank/zaakbrug/compare/v1.13.21...v1.13.22) (2023-11-30)


### 🔁 Continuous Integration

* automatically create jira issue when github issues are created ([#199](https://github.com/wearefrank/zaakbrug/issues/199)) ([b4dd9f7](https://github.com/wearefrank/zaakbrug/commit/b4dd9f7346547bff192ef30029a4a7dc78a88b4f))

## [1.13.21](https://github.com/wearefrank/zaakbrug/compare/v1.13.20...v1.13.21) (2023-11-29)


### 🐛 Bug Fixes

* geefLijstZaakdocument missing dct.omschrijving in response ([#215](https://github.com/wearefrank/zaakbrug/issues/215)) ([5701b14](https://github.com/wearefrank/zaakbrug/commit/5701b14704392cfbb312b2ec7ee66a39233d77d7))

## [1.13.20](https://github.com/wearefrank/zaakbrug/compare/v1.13.19...v1.13.20) (2023-11-24)


### 🐛 Bug Fixes

* statusMapping problem and vertrouwelijk attribute ([9641cec](https://github.com/wearefrank/zaakbrug/commit/9641cec3eedb91e3e755b6e8bd6d2f287b21263c))

## [1.13.19](https://github.com/wearefrank/zaakbrug/compare/v1.13.18...v1.13.19) (2023-11-20)


### ✅ Tests

* Keep JWT-token generation within the scope of a testcase in SoapUI ([#193](https://github.com/wearefrank/zaakbrug/issues/193)) ([0f7f6e3](https://github.com/wearefrank/zaakbrug/commit/0f7f6e3270d4bf679f6f49e50bccc49b19c42603))

## [1.13.18](https://github.com/wearefrank/zaakbrug/compare/v1.13.17...v1.13.18) (2023-11-17)


### 🐛 Bug Fixes

* soap endpoints invalidates input messages when unknown namespaces are present in the soap header ([#185](https://github.com/wearefrank/zaakbrug/issues/185)) ([e10adbc](https://github.com/wearefrank/zaakbrug/commit/e10adbc4e01317ae6eb5a21d59c9e3f59addb80e))

## [1.13.17](https://github.com/wearefrank/zaakbrug/compare/v1.13.16...v1.13.17) (2023-11-17)


### ✅ Tests

* reduce SoapUI project size so that merge editors dont crash ([2867474](https://github.com/wearefrank/zaakbrug/commit/2867474baddf0888208bad6c401e14d98f6f5102))
* testcases continue running when a teststep fails ([#189](https://github.com/wearefrank/zaakbrug/issues/189)) ([01ab1ff](https://github.com/wearefrank/zaakbrug/commit/01ab1fff0a00d8178c2e2959a0efc5030fb86a95))

## [1.13.16](https://github.com/wearefrank/zaakbrug/compare/v1.13.15...v1.13.16) (2023-11-15)


### 🐛 Bug Fixes

* change zgwzaak to root createZakLa1response ([cdfc9f9](https://github.com/wearefrank/zaakbrug/commit/cdfc9f91b0f7f453dc54f98a3bfcd0c40c3a652b))
* create zaak with relevante andere zaken ([2ab1873](https://github.com/wearefrank/zaakbrug/commit/2ab1873f7dcf71937a8a9ea9a2f7ddb13dcce103))
* creeerZaak and updateZaak are not correctly handling relevanteAndereZaken relations ([e616ecf](https://github.com/wearefrank/zaakbrug/commit/e616ecf67d1e5caf63ed409e03b470e4aab0e9ec))
* creeerZaak reflects new changes made to andereZaken configuration ([cebbb1b](https://github.com/wearefrank/zaakbrug/commit/cebbb1bd40bf2132c0efefd098b6a80a3e6fb657))
* Error when gerelateerde is not present ([fcfc026](https://github.com/wearefrank/zaakbrug/commit/fcfc02685c5dc47cc4998d7bb0b155bb466fdcd1))
* rollmapping in catalogi ([d071819](https://github.com/wearefrank/zaakbrug/commit/d071819314b336cc835458d43cbf66a4ef1caf62))
* updateZaak createupdateZaakbody ([712bc72](https://github.com/wearefrank/zaakbrug/commit/712bc7294d0fb8cb030d076bfb5e12bffe3938d2))
* updateZaak now properly relates relevanteAndereZaken ([d159b29](https://github.com/wearefrank/zaakbrug/commit/d159b29c0c4685fd9907199639feabc2554c1f05))
* updateZaak status wrong forward ([fb7f0da](https://github.com/wearefrank/zaakbrug/commit/fb7f0dac7be4f83207c3e08292767809529ad918))

## [1.13.15](https://github.com/wearefrank/zaakbrug/compare/v1.13.14...v1.13.15) (2023-11-14)


### 🧑‍💻 Code Refactoring

* remove errorstores on all adapters so that errors are not accidentally ignored ([#179](https://github.com/wearefrank/zaakbrug/issues/179)) ([adf1b67](https://github.com/wearefrank/zaakbrug/commit/adf1b67eeed25f509c02e30a2074209fd995f01a))

## [1.13.14](https://github.com/wearefrank/zaakbrug/compare/v1.13.13...v1.13.14) (2023-11-13)


### ✅ Tests

* add zaakbrug app credentials in openzaak automatically and replace manual catalog import with add&delete calls in testcase setup and teardown ([#174](https://github.com/wearefrank/zaakbrug/issues/174)) ([4f1140d](https://github.com/wearefrank/zaakbrug/commit/4f1140ddc4a87236c0fb6c35d521fefa429a80d3))

## [1.13.13](https://github.com/wearefrank/zaakbrug/compare/v1.13.12...v1.13.13) (2023-11-10)


### 🧑‍💻 Code Refactoring

* improve error feedback when informatieobjectype with omschrijving not found ([#167](https://github.com/wearefrank/zaakbrug/issues/167)) ([65aaf56](https://github.com/wearefrank/zaakbrug/commit/65aaf56f80fc98282c668c9b70d7b955afa64f09))

## [1.13.12](https://github.com/wearefrank/zaakbrug/compare/v1.13.11...v1.13.12) (2023-11-02)


### ✅ Tests

* lock openzaak to 1.9.0 in test docker-compose ([4a573d7](https://github.com/wearefrank/zaakbrug/commit/4a573d78b6287e656b4aff6d6c21af671e4761d0))

## [1.13.11](https://github.com/wearefrank/zaakbrug/compare/v1.13.10...v1.13.11) (2023-11-02)


### 🔥 Performance Improvements

* updateDocument with old and new state large documents performance improvement ([3287e8b](https://github.com/wearefrank/zaakbrug/commit/3287e8b4ab6906447540481ed135a49366c94a5a))


### ✅ Tests

* add updateDocument large documents performance test ([f5f0ba4](https://github.com/wearefrank/zaakbrug/commit/f5f0ba48467d445e9f69b92fe3df13dbbb40ed7d))

## [1.13.10](https://github.com/wearefrank/zaakbrug/compare/v1.13.9...v1.13.10) (2023-10-31)


### 🐛 Bug Fixes

* update document fails when input has 2 document objects ([#173](https://github.com/wearefrank/zaakbrug/issues/173)) ([9f37267](https://github.com/wearefrank/zaakbrug/commit/9f372675133046c535fe61f9aacc9b04850540ec))

## [1.13.9](https://github.com/wearefrank/zaakbrug/compare/v1.13.8...v1.13.9) (2023-10-27)


### 🐛 Bug Fixes

* redo ff bump for doucment retreival nulls ([#172](https://github.com/wearefrank/zaakbrug/issues/172)) ([cd68d6f](https://github.com/wearefrank/zaakbrug/commit/cd68d6f2ecdf7c9be8c998da58600cf3f70d5b4f))

## [1.13.8](https://github.com/wearefrank/zaakbrug/compare/v1.13.7...v1.13.8) (2023-10-27)


### ⏩ Reverts

* Revert "Bump F!F version to fix document retreival (#5625) (#168)" (#169) ([1ebd2e1](https://github.com/wearefrank/zaakbrug/commit/1ebd2e11ebd06cc1142b8c00072e5765061210d4)), closes [#5625](https://github.com/wearefrank/zaakbrug/issues/5625) [#168](https://github.com/wearefrank/zaakbrug/issues/168) [#169](https://github.com/wearefrank/zaakbrug/issues/169)

## [1.13.7](https://github.com/wearefrank/zaakbrug/compare/v1.13.6...v1.13.7) (2023-10-13)


### 🐛 Bug Fixes

* identificatie generation producing duplicates during highly-concurrent workload & first identificatie always failing ([#166](https://github.com/wearefrank/zaakbrug/issues/166)) ([7027fd8](https://github.com/wearefrank/zaakbrug/commit/7027fd8a74a49d518a6eef9eceebd22701c89de1))

## [1.13.6](https://github.com/wearefrank/zaakbrug/compare/v1.13.5...v1.13.6) (2023-10-11)


### 🤖 Build System

* **dependencies:** bump f!f version to 7.9-20231006.001807 ([#164](https://github.com/wearefrank/zaakbrug/issues/164)) ([b9f0764](https://github.com/wearefrank/zaakbrug/commit/b9f0764011fb357c303e95254b9356fefaf5c050))

## [1.13.5](https://github.com/wearefrank/zaakbrug/compare/v1.13.4...v1.13.5) (2023-10-02)


### 🐛 Bug Fixes

* errors due to missing roltype field when adding roles ([#162](https://github.com/wearefrank/zaakbrug/issues/162)) ([84e4921](https://github.com/wearefrank/zaakbrug/commit/84e49218032c0558719979b5dee0835f972b4190))

## [1.13.4](https://github.com/ibissource/zaakbrug/compare/v1.13.3...v1.13.4) (2023-09-18)


### ✅ Tests

* **docker-compose:** add optional pgadmin behind profile for zaakbrug postgres db ([a98cc27](https://github.com/ibissource/zaakbrug/commit/a98cc271f00f5062f8677fc7bea9f69dbf16396d))

## [1.13.3](https://github.com/ibissource/zaakbrug/compare/v1.13.2...v1.13.3) (2023-09-18)


### ✅ Tests

* **docker-compose:** add optional postgres db for zaakbrug ([#107](https://github.com/ibissource/zaakbrug/issues/107)) ([3d1ab2b](https://github.com/ibissource/zaakbrug/commit/3d1ab2b01309a7aada4c4a2ec3d1f6b520134060))

## [1.13.2](https://github.com/ibissource/zaakbrug/compare/v1.13.1...v1.13.2) (2023-09-15)


### 🤖 Build System

* migration to java 11 runtime for better performance and memory usage ([b273991](https://github.com/ibissource/zaakbrug/commit/b273991945db534333e57bb961864ef14becf152))
* pass ff version to dockerfile with variables ([f110c38](https://github.com/ibissource/zaakbrug/commit/f110c3878485bca34f4f5a46e58a99458902f195))

## [1.13.1](https://github.com/ibissource/zaakbrug/compare/v1.13.0...v1.13.1) (2023-09-13)


### 🧑‍💻 Code Refactoring

* replace get roltypen query by zaaktype with individual calls to roltype by their uuid to make them cachable ([#113](https://github.com/ibissource/zaakbrug/issues/113)) ([0df9e15](https://github.com/ibissource/zaakbrug/commit/0df9e157003d20ce418ec3a96211ca40e567f109))

## [1.13.0](https://github.com/ibissource/zaakbrug/compare/v1.12.41...v1.13.0) (2023-09-13)


### 🍕 Features

* migrate Helm chart to dedicated chart repository ([#153](https://github.com/ibissource/zaakbrug/issues/153)) ([d71dd0f](https://github.com/ibissource/zaakbrug/commit/d71dd0f253f08a7953885e8aac63aa6ea02544a1))

## [1.12.41](https://github.com/ibissource/zaakbrug/compare/v1.12.40...v1.12.41) (2023-09-13)


### 🔥 Performance Improvements

* base64 to disk before validation & from disk after response wrapping ([8cf6ca1](https://github.com/ibissource/zaakbrug/commit/8cf6ca1b75e787e813be454f8c8b9e8cad825cbb))
* soap-endpoints refactor to reduce large file memory usage ([757a003](https://github.com/ibissource/zaakbrug/commit/757a00374c5371a8af54656807dc4a6c9978cc67))
* zds 1.2 soap-endpoint refactor to reduce large file memory usage ([31bb8ab](https://github.com/ibissource/zaakbrug/commit/31bb8ab4ef8797b3f44401fbd0ba08a2fa904050))


### 🧑‍💻 Code Refactoring

* dedicated handler for GeefZaakdocumentbewerken soap action ([69caceb](https://github.com/ibissource/zaakbrug/commit/69caceb219e4ca5737f94e1b6e315b7ba9d5a907))


### ✅ Tests

* assertions added to match base64 in requests & responses ([f1ff11d](https://github.com/ibissource/zaakbrug/commit/f1ff11d2f571330b3a932cfb35a7d3d34326b31f))
* performance tests for large documents & identificatie concurrency ([9d5adb3](https://github.com/ibissource/zaakbrug/commit/9d5adb3dca9be4929c4cdd240db8d06394b6bd1e))
* supplemental docker-compose for performance testing ([41abdf3](https://github.com/ibissource/zaakbrug/commit/41abdf3db05c0274546b85eba285f5582354fe65))


### 🤖 Build System

* add experimental java 11 Dockerfile ([0c45e0e](https://github.com/ibissource/zaakbrug/commit/0c45e0eb79328aba303b10bfe83f8a0cccebb38d))
* **depencies:** bump f!f version to 7.9-20230810.190012 ([fa5ac85](https://github.com/ibissource/zaakbrug/commit/fa5ac8584fa6707579be331d4a278a94fb845909))
* improved java 11 dockefile by building from tomcat image ([6016c5a](https://github.com/ibissource/zaakbrug/commit/6016c5a0a194c1be26f1c65dcd36742dbaae5e3b))

## [1.12.40](https://github.com/ibissource/zaakbrug/compare/v1.12.39...v1.12.40) (2023-09-11)


### 🤖 Build System

* **dependencies:** bump f!f version to 7.9-20230905.223421 ([8c2f24d](https://github.com/ibissource/zaakbrug/commit/8c2f24dae98798901b717bb3e58d88fcd24b83d1))

## [1.12.39](https://github.com/ibissource/zaakbrug/compare/v1.12.38...v1.12.39) (2023-09-07)


### ⏩ Reverts

* Revert "fix: identificatie generation producing duplicates during highly-concurrent workload (#143)" (#151) ([db33368](https://github.com/ibissource/zaakbrug/commit/db333682b8ec1a8966903dfce6e6fcbbdcc1e59a)), closes [#143](https://github.com/ibissource/zaakbrug/issues/143) [#151](https://github.com/ibissource/zaakbrug/issues/151)

## [1.12.38](https://github.com/ibissource/zaakbrug/compare/v1.12.37...v1.12.38) (2023-09-07)


### 🐛 Bug Fixes

* Error message not returned to CLO in ForEachChildElementPipe in GeefLijstZaakdocumenten adapter ([#150](https://github.com/ibissource/zaakbrug/issues/150)) ([7d574c9](https://github.com/ibissource/zaakbrug/commit/7d574c994d85ada4896e00e6d0620dc3a8e6c0fa))

## [1.12.37](https://github.com/ibissource/zaakbrug/compare/v1.12.36...v1.12.37) (2023-09-06)


### 🐛 Bug Fixes

* identificatie generation producing duplicates during highly-concurrent workload ([#143](https://github.com/ibissource/zaakbrug/issues/143)) ([3235a62](https://github.com/ibissource/zaakbrug/commit/3235a6242e00550ae0cd42189035e4bc326d02ef))

## [1.12.36](https://github.com/ibissource/zaakbrug/compare/v1.12.35...v1.12.36) (2023-09-06)


### ✅ Tests

* add commented out pgadmin container to sentry docker-compose for postgres browsing ([bb42fbc](https://github.com/ibissource/zaakbrug/commit/bb42fbca1968886c4173a034b3f4c65db12f0019))
* add sentry instance in test-environment and add instructions to contributing.md ([e210682](https://github.com/ibissource/zaakbrug/commit/e2106827c30b246ef51387fd9a3d688b9908c50a))

## [1.12.35](https://github.com/ibissource/zaakbrug/compare/v1.12.34...v1.12.35) (2023-09-01)


### 🐛 Bug Fixes

* error message not returned to CLO ([6bf900a](https://github.com/ibissource/zaakbrug/commit/6bf900a22726bf629d90eaca41444d764d99d8bd))

## [1.12.34](https://github.com/ibissource/zaakbrug/compare/v1.12.33...v1.12.34) (2023-08-30)


### 🔁 Continuous Integration

* revert semantic-release dependecies due to breaking change ([247909a](https://github.com/ibissource/zaakbrug/commit/247909a6e08a15279fe68efcb94e53679e4c13ab))

## [1.12.33](https://github.com/ibissource/zaakbrug/compare/v1.12.32...v1.12.33) (2023-08-10)


### 🧑‍💻 Code Refactoring

* moved gemeentecode to rsin logic to dedicated adapter ([#138](https://github.com/ibissource/zaakbrug/issues/138)) ([9c866c0](https://github.com/ibissource/zaakbrug/commit/9c866c0ecf2711b1859aa37ea6e1c79ee20f0788))

## [1.12.32](https://github.com/ibissource/zaakbrug/compare/v1.12.31...v1.12.32) (2023-08-10)


### 🧑‍💻 Code Refactoring

* add besluiten endpoint configuration ([#139](https://github.com/ibissource/zaakbrug/issues/139)) ([a6af85f](https://github.com/ibissource/zaakbrug/commit/a6af85fb86041e798f808cf2ae454e14d166417d))

## [1.12.31](https://github.com/ibissource/zaakbrug/compare/v1.12.30...v1.12.31) (2023-07-31)


### 🧑‍💻 Code Refactoring

* scaffold zds 1.2 soap-endpoint OntvangAsynchroonMutatie v2 ([#136](https://github.com/ibissource/zaakbrug/issues/136)) ([e0a14f8](https://github.com/ibissource/zaakbrug/commit/e0a14f8a0b36799c32e31489e85e21b6dfd374a9))

## [1.12.30](https://github.com/ibissource/zaakbrug/compare/v1.12.29...v1.12.30) (2023-07-28)


### 🧑‍💻 Code Refactoring

* scaffold zds 1.2 soap-endpoint BeantwoordVraag ([#134](https://github.com/ibissource/zaakbrug/issues/134)) ([efdcb33](https://github.com/ibissource/zaakbrug/commit/efdcb33a7494f32fd898e335c272aa2341c5fe3c))
* scaffold zds 1.2 soap-endpoint OntvangAsynchroon_Overdragen_v2 ([#135](https://github.com/ibissource/zaakbrug/issues/135)) ([492ea99](https://github.com/ibissource/zaakbrug/commit/492ea994000bbe7bf1d467a583dfc430e07febc4))

## [1.12.29](https://github.com/ibissource/zaakbrug/compare/v1.12.28...v1.12.29) (2023-07-27)


### 🧑‍💻 Code Refactoring

* implement zds 1.2 genereerBesluitIdentificatie_Di02 SOAP-action ([#133](https://github.com/ibissource/zaakbrug/issues/133)) ([d31f315](https://github.com/ibissource/zaakbrug/commit/d31f315f7ab3ddc6ca121d56e2b955c7816dcab3))

## [1.12.28](https://github.com/ibissource/zaakbrug/compare/v1.12.27...v1.12.28) (2023-07-27)


### 🐛 Bug Fixes

* authorization token missing for GetZaakDocumentByUrl ([#132](https://github.com/ibissource/zaakbrug/issues/132)) ([4f9c780](https://github.com/ibissource/zaakbrug/commit/4f9c7800c1846091b6f2c23b0dd34599fc880a3c))

## [1.12.27](https://github.com/ibissource/zaakbrug/compare/v1.12.26...v1.12.27) (2023-07-12)


### 🐛 Bug Fixes

* docker-compose network name correction due to changes in latest docker-compose version ([#131](https://github.com/ibissource/zaakbrug/issues/131)) ([a9806a2](https://github.com/ibissource/zaakbrug/commit/a9806a26c954017988ef0737d80207db1e6bdec0))

## [1.12.26](https://github.com/ibissource/zaakbrug/compare/v1.12.25...v1.12.26) (2023-07-04)


### 🐛 Bug Fixes

* host header for apiProxy ([a0f0bac](https://github.com/ibissource/zaakbrug/commit/a0f0baca3f898124c14fc346c10c3a819dcf0a83))

## [1.12.25](https://github.com/ibissource/zaakbrug/compare/v1.12.24...v1.12.25) (2023-07-04)


### 🐛 Bug Fixes

* make nginx able to run as non-root and on a read-only filesystem ([70f0690](https://github.com/ibissource/zaakbrug/commit/70f0690f767eb8e7adf1e044d9019ab474089a10))

## [1.12.24](https://github.com/ibissource/zaakbrug/compare/v1.12.23...v1.12.24) (2023-07-03)


### 🐛 Bug Fixes

* nginxLabelSelectors ([0399aff](https://github.com/ibissource/zaakbrug/commit/0399affd0e86291573eb6cb8debf49e62295d166))

## [1.12.23](https://github.com/ibissource/zaakbrug/compare/v1.12.22...v1.12.23) (2023-07-03)


### 🐛 Bug Fixes

* disable zgw api's by default ([e320fc6](https://github.com/ibissource/zaakbrug/commit/e320fc65deb7abb8045ec39bb49196927181a532))

## [1.12.22](https://github.com/ibissource/zaakbrug/compare/v1.12.21...v1.12.22) (2023-07-03)


### 🧑‍💻 Code Refactoring

* proxy calls to zgw api's to staging ([#110](https://github.com/ibissource/zaakbrug/issues/110)) ([0371c12](https://github.com/ibissource/zaakbrug/commit/0371c12a4411b26074ffee70f941dc982af03706))

## [1.12.21](https://github.com/ibissource/zaakbrug/compare/v1.12.20...v1.12.21) (2023-06-29)


### 🧑‍💻 Code Refactoring

* add NGinX reverse proxy to the Helm Chart ([#128](https://github.com/ibissource/zaakbrug/issues/128)) ([660310b](https://github.com/ibissource/zaakbrug/commit/660310b288f9e843fc2f5cf51a63dba6706b5faf))

## [1.12.20](https://github.com/ibissource/zaakbrug/compare/v1.12.19...v1.12.20) (2023-06-26)


### 🐛 Bug Fixes

* optional staging is enabled by default ([e54e657](https://github.com/ibissource/zaakbrug/commit/e54e6574a4a7687e60945ae14b5b13506031db3f))

## [1.12.19](https://github.com/ibissource/zaakbrug/compare/v1.12.18...v1.12.19) (2023-06-23)


### 🐛 Bug Fixes

* **helm:** tomcatUsers default should be an empty array ([#126](https://github.com/ibissource/zaakbrug/issues/126)) ([b4bfe7e](https://github.com/ibissource/zaakbrug/commit/b4bfe7e2063d42296c1876a8e236b7e4161375d0))

## [1.12.18](https://github.com/ibissource/zaakbrug/compare/v1.12.17...v1.12.18) (2023-06-23)


### 🤖 Build System

* lock frank-framework base image to tag instead of snapshot ([#125](https://github.com/ibissource/zaakbrug/issues/125)) ([77b8031](https://github.com/ibissource/zaakbrug/commit/77b803125ab358e82a7871908ebc47b47a41c9f9))


### 🔁 Continuous Integration

* add workflow to create a base image for the zaakbrug ([#122](https://github.com/ibissource/zaakbrug/issues/122)) ([b7d1383](https://github.com/ibissource/zaakbrug/commit/b7d13832822564f0033e2d2a36d4a7b96c81e25c))
* remove docker image artifact automatically after one day ([#123](https://github.com/ibissource/zaakbrug/issues/123)) ([61b8b1d](https://github.com/ibissource/zaakbrug/commit/61b8b1d9c7f52a7368853afd21178df06e410200))

## [1.12.17](https://github.com/ibissource/zaakbrug/compare/v1.12.16...v1.12.17) (2023-06-23)


### 🐛 Bug Fixes

* every call to a subadapter is shown as a seperate message in Ladybug ([#121](https://github.com/ibissource/zaakbrug/issues/121)) ([259c444](https://github.com/ibissource/zaakbrug/commit/259c4448e96ca915b64470a080411dfd7490de54))

## [1.12.16](https://github.com/ibissource/zaakbrug/compare/v1.12.15...v1.12.16) (2023-06-22)


### 🧑‍💻 Code Refactoring

* add optional staging openzaak deployment to helm for zgw to zds translation ([#104](https://github.com/ibissource/zaakbrug/issues/104)) ([4dd4af1](https://github.com/ibissource/zaakbrug/commit/4dd4af189b7a10b9819ef16b473635434af66692))

## [1.12.15](https://github.com/ibissource/zaakbrug/compare/v1.12.14...v1.12.15) (2023-06-16)


### ✅ Tests

* added aanvraag collectieve zorgverzekering zaaktype as e2e test… ([#109](https://github.com/ibissource/zaakbrug/issues/109)) ([dc9a2de](https://github.com/ibissource/zaakbrug/commit/dc9a2de293c566ec373c2d4d5fbec47d195d50d1))

## [1.12.14](https://github.com/ibissource/zaakbrug/compare/v1.12.13...v1.12.14) (2023-06-16)


### 🔁 Continuous Integration

* include chart yaml in semantic release git commit ([83e2a91](https://github.com/ibissource/zaakbrug/commit/83e2a91e3d07ebfad464bc78cb28980e5979a4a3))

## [1.12.13](https://github.com/ibissource/zaakbrug/compare/v1.12.12...v1.12.13) (2023-06-16)


### 🔁 Continuous Integration

* auto bump helm chart version added to semantic-release ([#118](https://github.com/ibissource/zaakbrug/issues/118)) ([03b44bc](https://github.com/ibissource/zaakbrug/commit/03b44bcf740e265259cc924ce3e460cb8f06176c))
* helm chart plugin dependency fix during release ([#119](https://github.com/ibissource/zaakbrug/issues/119)) ([aa1ffe7](https://github.com/ibissource/zaakbrug/commit/aa1ffe77024c8ea1f084c3a9b7afb409ef4ffc86))

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
