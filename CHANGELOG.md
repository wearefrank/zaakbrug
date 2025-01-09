[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

## [1.22.8](https://github.com/wearefrank/zaakbrug/compare/v1.22.7...v1.22.8) (2025-01-08)

### 🐛 Bug Fixes

* zaak 'heeft.indicatieLaatsteStatus' incorrectly uses zgw 'statustype.isEindstatus' instead of 'status.indicatieLaatstGezetteStatus' ([e443421](https://github.com/wearefrank/zaakbrug/commit/e44342160faf53f88d443eb5d7f3ff5a925209ee))

### 🧑‍💻 Code Refactoring

* missing descriptive error message when resultaattype not found during updateZaak when resultaat is present in input message ([#486](https://github.com/wearefrank/zaakbrug/issues/486)) ([b0104d9](https://github.com/wearefrank/zaakbrug/commit/b0104d9d49be339fda9e2b10597bb1aef1d90c64))
* use current zds time instead of 000000 when creating status from einddatum or from sta.datumStatusGezet in voegZaakdocumentToe ([243eb31](https://github.com/wearefrank/zaakbrug/commit/243eb31f2d09b4bdfe44b54547ce6488c5bdbf5b))

### ✅ Tests

* update test cases according to the update of heeft.indicatieLaatsteStatus field ([54c3cec](https://github.com/wearefrank/zaakbrug/commit/54c3cec575dd548f193c2ab8c36acad1d7380c59))
* **unit:** validate/fix disabled Larva testcases after obsolete broken testcases cleanup ([#489](https://github.com/wearefrank/zaakbrug/issues/489)) ([be19513](https://github.com/wearefrank/zaakbrug/commit/be195130da1f657d0d84e8ccb10d613585ff49f6))

### 🤖 Build System

* **dependencies:** bump the docusaurus group ([#495](https://github.com/wearefrank/zaakbrug/issues/495)) ([6679001](https://github.com/wearefrank/zaakbrug/commit/6679001a765ee1b032832425667d2feef79031c8))
* **dependencies:** bump the docusaurus group across 1 directory with 7 updates ([#488](https://github.com/wearefrank/zaakbrug/issues/488)) ([748456f](https://github.com/wearefrank/zaakbrug/commit/748456f274154bdba5310f54d90c79438d0925f3))
* **dependencies:** bump the github-actions group across 1 directory with 2 updates ([#475](https://github.com/wearefrank/zaakbrug/issues/475)) ([930013a](https://github.com/wearefrank/zaakbrug/commit/930013a083ac7810e6f9dc81a6ca63fa9a8d4efa))

### 🔁 Continuous Integration

* automatically run Larva tests as part of CI workflows ([#479](https://github.com/wearefrank/zaakbrug/issues/479)) ([2f18e2d](https://github.com/wearefrank/zaakbrug/commit/2f18e2d78734ce6030fad8e61613b623a51feac4))
* fix incorrect job dependency version-next to analyze-commits ([55b4ef0](https://github.com/wearefrank/zaakbrug/commit/55b4ef07e040aefd998ccc004b74885ce5c5abdb))

## [1.22.7](https://github.com/wearefrank/zaakbrug/compare/v1.22.6...v1.22.7) (2024-12-17)

### 🐛 Bug Fixes

* heeftBetrekkingOpAndere does not respect verwerkingssoort causing duplicates and inability to delete gerelateerde zaken ([7243e0f](https://github.com/wearefrank/zaakbrug/commit/7243e0f20a668037cf657d19823d83e19ada908a))
* remove bezoekadres/verblijfadres from role matching between ZDS and ZGW due to situational dataloss in translation ([#478](https://github.com/wearefrank/zaakbrug/issues/478)) ([98a24c4](https://github.com/wearefrank/zaakbrug/commit/98a24c4f0c6492245a27fb20c11302adda04a2f3))
* remove relevanteAndereZaken from updateZaak request cause it is handled separately ([90c51b0](https://github.com/wearefrank/zaakbrug/commit/90c51b039a02b984d1875091ce490d423ba866d5))
* update verwerkingssoort letter of heeftBetrekkingOpAndere in creeerZaak from W to T ([8a849c1](https://github.com/wearefrank/zaakbrug/commit/8a849c12025bdd8dfada24d90831913461612db2))
* updateZaak with multiple heeftBetrekkingOpAndere already on the case results in error ([663516b](https://github.com/wearefrank/zaakbrug/commit/663516b48f335744326d164a941db86187c588fc))

### 🧑‍💻 Code Refactoring

* generalize ZDS roles was and wordt merger xslt to support merging all root aggregates ([2131767](https://github.com/wearefrank/zaakbrug/commit/213176726ec9e8c462019c71bd051d893370be49))
* Used PostZgwZaak.xsd instead of AndereZaakBodyToJson.xsd + used XmlSwitchPipe instead of XmlIfPipe in CheckVerwerkingssoortAttribute + used Zaken_UpdateZgwZaak for patch request ([017bfd9](https://github.com/wearefrank/zaakbrug/commit/017bfd97776151c5f5eb726a8ed61076202fc949))

### ✅ Tests

* **e2e:** add variety of e2e testcases for testing heeftBetrekkingOpAndere behavior ([757f127](https://github.com/wearefrank/zaakbrug/commit/757f127eacd8184bfd86ea99614b5ca367625904))
* **larva:** cleanup old broken Larva testcases that are now replaced by SoapUI end-2-end testcases ([#480](https://github.com/wearefrank/zaakbrug/issues/480)) ([934e839](https://github.com/wearefrank/zaakbrug/commit/934e8391a1bf4b10a8c116e4a6d95b6c0fac2498))
* **unit:** MergeZdsWasAndWordt Larva testcases ([6bf6159](https://github.com/wearefrank/zaakbrug/commit/6bf61597fdd8ee872f6ff205d30efc2efad26853))

## [1.22.6](https://github.com/wearefrank/zaakbrug/compare/v1.22.5...v1.22.6) (2024-12-06)

### 🐛 Bug Fixes

* remove bezoekadres/verblijfadres from role matching between ZDS and ZGW due to situational dataloss in translation ([#478](https://github.com/wearefrank/zaakbrug/issues/478)) ([38a59bd](https://github.com/wearefrank/zaakbrug/commit/38a59bdb58d9c74fd824156ffaf6b69262113fa0))

### ✅ Tests

* **larva:** cleanup old broken Larva testcases that are now replaced by SoapUI end-2-end testcases ([#480](https://github.com/wearefrank/zaakbrug/issues/480)) ([0749015](https://github.com/wearefrank/zaakbrug/commit/0749015b5fbe4b5b6f360299bb9e74ca46340ca2))

## [1.22.5](https://github.com/wearefrank/zaakbrug/compare/v1.22.4...v1.22.5) (2024-11-11)

### 🐛 Bug Fixes

* updateZaak incorrectly adds the be deleted rol when updateZaak message deletes and adds a role with the same roltype when the to be deleted role cannot be found. ([5e68d4c](https://github.com/wearefrank/zaakbrug/commit/5e68d4c57370ce4e6000e0f118fe314bca5c1bae))

### ✅ Tests

* **e2e:** add testcase to test updateZaak deleting and adding a role with the same roltype when role to be deleted cannot be found. ([1781f65](https://github.com/wearefrank/zaakbrug/commit/1781f6596fdb42a4d239bb21fb0a12478151dcdb))

## [1.22.4](https://github.com/wearefrank/zaakbrug/compare/v1.22.3...v1.22.4) (2024-10-29)

### 🤖 Build System

* **dependencies:** bump f!f version to 9.0.0-20241026.042336 ([cbdceb4](https://github.com/wearefrank/zaakbrug/commit/cbdceb4058ffd4e61aedc7276a2e2509a60b927a))
* **dependencies:** bump the github-actions group with 1 update ([d819fb2](https://github.com/wearefrank/zaakbrug/commit/d819fb23669d91cc6f5b646b6a0c561cd8c49ca4))
* **dependencies:** bump the github-actions group with 3 updates ([#460](https://github.com/wearefrank/zaakbrug/issues/460)) ([961fd2f](https://github.com/wearefrank/zaakbrug/commit/961fd2f610ca242bae51c1299b88e57f810fa3fa))

### 🔁 Continuous Integration

* schedule syntax fix for bump-ff-version.yml ([3a37add](https://github.com/wearefrank/zaakbrug/commit/3a37add5101c000d67420661cb4aed29aa8bb2d3))

## [1.22.3](https://github.com/wearefrank/zaakbrug/compare/v1.22.2...v1.22.3) (2024-10-23)

### 🎨 Styles

* update docusaurus styles and images ([#450](https://github.com/wearefrank/zaakbrug/issues/450)) ([78f80a1](https://github.com/wearefrank/zaakbrug/commit/78f80a1381dc48ae262a3b71a6773ba03190b4d2)), closes [#404](https://github.com/wearefrank/zaakbrug/issues/404)

### 🧑‍💻 Code Refactoring

* replace FixedResultPipe with EchoPipe due to deprecated FixedResultPipe functionality ([#449](https://github.com/wearefrank/zaakbrug/issues/449)) ([9c9a2f0](https://github.com/wearefrank/zaakbrug/commit/9c9a2f0cbbda3c5cd85fc66e7126404702db1c23))
* replace XsltPipe error forwards to exception and use ReplacerPipe instead of FixedResultPipe due to deprecated functionality ([#456](https://github.com/wearefrank/zaakbrug/issues/456)) ([42b7867](https://github.com/wearefrank/zaakbrug/commit/42b786789075d7fe033e974d2722c890089a894b))

### 🤖 Build System

* **dependencies:** bump the docusaurus group across 1 directory with 2 updates ([#458](https://github.com/wearefrank/zaakbrug/issues/458)) ([7582bd6](https://github.com/wearefrank/zaakbrug/commit/7582bd6ba0fdedd66d7e97f6af84f76a00eb02ae))
* **dependencies:** bump the github-actions group across 1 directory with 6 updates ([#457](https://github.com/wearefrank/zaakbrug/issues/457)) ([bae3359](https://github.com/wearefrank/zaakbrug/commit/bae33593768b1457c5331e2ad53af07eb3b48765))

## [1.22.2](https://github.com/wearefrank/zaakbrug/compare/v1.22.1...v1.22.2) (2024-10-17)

### 🐛 Bug Fixes

* update FF version to 8.3.0-20240910.042339 ([2b1b9a8](https://github.com/wearefrank/zaakbrug/commit/2b1b9a8cfbabe79d5a660ad8c477c560c2911c07))

## [1.22.1](https://github.com/wearefrank/zaakbrug/compare/v1.22.0...v1.22.1) (2024-10-15)

### 🐛 Bug Fixes

* arrays are not correctly processed as arrays when merging ZGW zaak and rol resources if a valueOverride is configured for that resource ([42c329d](https://github.com/wearefrank/zaakbrug/commit/42c329d9791544ee509c5233a6ff1f60220a8834))

### 🤖 Build System

* **dependencies:** bump f!f version to 8.3.0-20241010.042329 ([73c14a4](https://github.com/wearefrank/zaakbrug/commit/73c14a489c46d826d24b70db23d3e8e0e9823c55))

## [1.22.0](https://github.com/wearefrank/zaakbrug/compare/v1.21.4...v1.22.0) (2024-10-01)

### 🍕 Features

* support for valueOverrides sourced from StUF:extraElementen for zgw zaak ([1296089](https://github.com/wearefrank/zaakbrug/commit/12960897911c9f54428b6553cd7f7dad869afbe7))
* support for valueOverrides sourced from StUF:extraElementen for zgw zaak ([6fd6707](https://github.com/wearefrank/zaakbrug/commit/6fd67073557553330795ef112838bc7210494e5d))
* support for valueOverrides values to be dynamicly sourced from StUF:extraElementen by using ${extraElementen:<name>} as value ([e9748f0](https://github.com/wearefrank/zaakbrug/commit/e9748f0d14a946e56d20fab2a2ca34a2cea04b05))
* support for valueOverrides values to be dynamicly sourced from StUF:extraElementen by using ${extraElementen:<name>} as value ([2df33c2](https://github.com/wearefrank/zaakbrug/commit/2df33c20d03908c32139ce50249f5632998053f6))
* valueOverrides values sourced from extraElementen are translated back to extraElementen during zgw to zds translations for case roles ([d5fefae](https://github.com/wearefrank/zaakbrug/commit/d5fefaebbb40cc36ef6c05dc1f268bc1002c0cab))
* valueOverrides values sourced from extraElementen are translated back to extraElementen during zgw to zds translations for case roles ([b881ee3](https://github.com/wearefrank/zaakbrug/commit/b881ee3d69fe85379933d10283e16c880b10db06))

### 🐛 Bug Fixes

* add default value 'N' for verblijfsadres authentiek for consistency between zgw to zds translations ([5a1b54b](https://github.com/wearefrank/zaakbrug/commit/5a1b54bc2b81220942ba6be0d5c44ea8a607de6a))
* add default value 'N' for verblijfsadres authentiek for consistency between zgw to zds translations ([bf84e6f](https://github.com/wearefrank/zaakbrug/commit/bf84e6f913b151ec9ac4cab8720d61ba8e409048))
* case roles with natuurlijkPersoon gerelateerde that use anp.identificatie or inp.a-nummer as identifier are not getting deleted ([1759e35](https://github.com/wearefrank/zaakbrug/commit/1759e35aa3721e72ada44674af037811a2fcb5c7))
* case roles with natuurlijkPersoon gerelateerde that use anp.identificatie or inp.a-nummer as identifier are not getting deleted ([c1468e0](https://github.com/wearefrank/zaakbrug/commit/c1468e0554d1fab56bb537bd52a6164994cb3e11))

### 📝 Documentation

* dynamic value overrides from StUF:extraElementen configuration ([046918d](https://github.com/wearefrank/zaakbrug/commit/046918d76ed626bcd1cee041a7045e59fd0d0008))

### 🧑‍💻 Code Refactoring

* add optional extraElementen section to zds rol to zgw rol translation ([c4c20b1](https://github.com/wearefrank/zaakbrug/commit/c4c20b1aa4e1bfd0498f928d2bbfd2c20b81e130))
* add optional extraElementen section to zds rol to zgw rol translation ([6837589](https://github.com/wearefrank/zaakbrug/commit/683758938d962c511aae9d868096adc3080d0401))
* change zgw updateZgwZaak adapter from PUT to PATCH and merge xsd's with PostZgwZaak.xsd ([5b91acb](https://github.com/wearefrank/zaakbrug/commit/5b91acbc0f910a980cfde2a245ab228e897553d0))
* change zgw updateZgwZaak adapter from PUT to PATCH and merge xsd's with PostZgwZaak.xsd ([8350e30](https://github.com/wearefrank/zaakbrug/commit/8350e307607a03a3aec5f5f210ea77c3d5a119f4))
* combine seperate translations to betrokkeneIdentificatie and zgw rol into a single translation from zds rol to zgw rol ([2168249](https://github.com/wearefrank/zaakbrug/commit/2168249b7eda2d9e9312c12dd3d4015af66bb556))
* combine seperate translations to betrokkeneIdentificatie and zgw rol into a single translation from zds rol to zgw rol ([0d9bbff](https://github.com/wearefrank/zaakbrug/commit/0d9bbff5f25b0de0e5e6da4cce7c7f0755ef36b0))
* copy zds heeftAls elements and gerelateerde instead of only gerelateerde during zds roles processing ([dccae08](https://github.com/wearefrank/zaakbrug/commit/dccae08b24a95c6a750aaa9d7bf55f53b4cca24e))
* copy zds heeftAls elements and gerelateerde instead of only gerelateerde during zds roles processing ([719324e](https://github.com/wearefrank/zaakbrug/commit/719324e8b593d440fb357e75845fd8fb3f0b3b23))
* correct order of elements for zgw to zds zaak translation ([d89d990](https://github.com/wearefrank/zaakbrug/commit/d89d990dfe087cf84e7c928e7499912404deafeb))
* correct order of elements for zgw to zds zaak translation ([3433818](https://github.com/wearefrank/zaakbrug/commit/34338188aa6ef12a29e4d46939ddc95ce7f4646d))
* move adding of namespace from zakLa01 response xslt to zgw to zds translation and copy it to the zakLa01 response instead ([67ad039](https://github.com/wearefrank/zaakbrug/commit/67ad03940756d280d733dda98a29eab80c01bb8f))
* move adding of namespace from zakLa01 response xslt to zgw to zds translation and copy it to the zakLa01 response instead ([60135c4](https://github.com/wearefrank/zaakbrug/commit/60135c45ebcd5f3c1175556e6ceb4b105b765d20))
* move adding of namespaces to zgw to zds translation ([faa0bda](https://github.com/wearefrank/zaakbrug/commit/faa0bda35980afdd0f1999d14975abb85e9205a8))
* move adding of namespaces to zgw to zds translation ([b48eb91](https://github.com/wearefrank/zaakbrug/commit/b48eb91b2a1d068631337bb7e9d1381ea60c8993))
* rewrite zds was zaak and wordt zaak role comparison to exclusively match on the primary identifier of the gerelateerde and if not available match on remaining kerngegevens elements ([48bf2ed](https://github.com/wearefrank/zaakbrug/commit/48bf2ed7ef1d65d1f5d4e76ce66a80b86edb7914))
* rewrite zds was zaak and wordt zaak role comparison to exclusively match on the primary identifier of the gerelateerde and if not available match on remaining kerngegevens elements ([2f99960](https://github.com/wearefrank/zaakbrug/commit/2f9996067ce1a3ed1921f864a347a9bad47bfa50))
* verblijfsadres should not be in response when empty ([be5fc8e](https://github.com/wearefrank/zaakbrug/commit/be5fc8e47319735432f9ffff3240690c94d31c9a))
* verblijfsadres should not be in response when empty ([651b301](https://github.com/wearefrank/zaakbrug/commit/651b30101e40a6620e7e65e7ca84e2661df8f715))

### ✅ Tests

* EnrichtEntity & EnrichEntity_ForEachPipeWrapped Larva testcases ([e13c0db](https://github.com/wearefrank/zaakbrug/commit/e13c0dbc3f3a3344d50ad915046fedf9ebdc29e0))
* EnrichtEntity & EnrichEntity_ForEachPipeWrapped Larva testcases ([11c286b](https://github.com/wearefrank/zaakbrug/commit/11c286bf4dc007eb6e063a9e019ff49879dda101))
* FilterBaseZdsZaak Larva testcases ([7d24fc6](https://github.com/wearefrank/zaakbrug/commit/7d24fc6e9b5228a1008977109cd5ee5a8f2fd73a))
* FilterBaseZdsZaak Larva testcases ([1f30193](https://github.com/wearefrank/zaakbrug/commit/1f3019333d85b3daafd93b7b047fe2bd42b426d3))
* fix testsuite 1 teardown failing due not able to delete a locked document ([86d7077](https://github.com/wearefrank/zaakbrug/commit/86d70774a47d6e0ede4763a39d0fd3820f86f9c3))
* fix testsuite 1 teardown failing due not able to delete a locked document ([5c4acd0](https://github.com/wearefrank/zaakbrug/commit/5c4acd009f6f0e552d67c31064e245ba54a193df))
* fix testsuite 1 teardown failing due not able to delete a locked document ([c982dd2](https://github.com/wearefrank/zaakbrug/commit/c982dd2f9aeed0f69cf6fcfaca9ac8ffabf9149b))
* fix testsuite 1 teardown failing due not able to delete a locked document ([287df7d](https://github.com/wearefrank/zaakbrug/commit/287df7dfad308f1573b1e7cac8f21ad93628b6b4))
* SelectZdsRoles & SelectZdsRolesFromListWithMatchingIdentity Larva testcases ([0350978](https://github.com/wearefrank/zaakbrug/commit/0350978102f1a0001a80363c5655224a18e2b20d))
* SelectZdsRoles & SelectZdsRolesFromListWithMatchingIdentity Larva testcases ([5094ca4](https://github.com/wearefrank/zaakbrug/commit/5094ca4d45891e9b6378d3fae40631468c8e6f33))
* valueOverrides related Larva testcases ([f2de2a7](https://github.com/wearefrank/zaakbrug/commit/f2de2a7238a95cee6f2ab6b3bec34af3b1d89b5f))
* valueOverrides related Larva testcases ([22e16de](https://github.com/wearefrank/zaakbrug/commit/22e16de67c74b22f5090caa1363cb3b50e3c8d11))
* valueOverrides sourced from extraElementen e2e testcases ([8a7b450](https://github.com/wearefrank/zaakbrug/commit/8a7b450c1abeb568dc0c0cfa1d807c11004a0ff7))
* valueOverrides sourced from extraElementen e2e testcases ([b78ae28](https://github.com/wearefrank/zaakbrug/commit/b78ae28215add7b83a2970ca77b634a26ca80602))
* ZgwRol xslt Larva regression test ([a76fb7f](https://github.com/wearefrank/zaakbrug/commit/a76fb7fa7fca2f032ea942340fc5b56f019802bf))
* ZgwRol xslt Larva regression test ([e8425a8](https://github.com/wearefrank/zaakbrug/commit/e8425a8f6e053ad38854bf2c8a76b080d6745966))

## [1.21.4](https://github.com/wearefrank/zaakbrug/compare/v1.21.3...v1.21.4) (2024-09-13)

### 🤖 Build System

* **dependencies:** bump-f!f-version-to-8.3.0-20240910.042339 ([#425](https://github.com/wearefrank/zaakbrug/issues/425)) ([7ca3cb9](https://github.com/wearefrank/zaakbrug/commit/7ca3cb9a7ee3af484b1000fe8ad36ef181ee0364))

## [1.21.3](https://github.com/wearefrank/zaakbrug/compare/v1.21.2...v1.21.3) (2024-09-13)

### 🐛 Bug Fixes

* having both einddatum and resultaat but no eindstatus in updateZaak does not close zaak based on einddatum ([#440](https://github.com/wearefrank/zaakbrug/issues/440)) ([4346f16](https://github.com/wearefrank/zaakbrug/commit/4346f1606c60d5563644977bffbf92deeac513d1))

### 🤖 Build System

* **dependencies:** bump prism-react-renderer ([#437](https://github.com/wearefrank/zaakbrug/issues/437)) ([c4bca52](https://github.com/wearefrank/zaakbrug/commit/c4bca52ae5d501a710d48c2e60f79a30365a7b4b))
* **dependencies:** bump the github-actions group across 1 directory with 2 updates ([#439](https://github.com/wearefrank/zaakbrug/issues/439)) ([56cef55](https://github.com/wearefrank/zaakbrug/commit/56cef55ae6b0807c0f629454f66e743cd3397443))

## [1.21.2](https://github.com/wearefrank/zaakbrug/compare/v1.21.1...v1.21.2) (2024-09-04)

### 🧑‍💻 Code Refactoring

* skip empty query parameters in GetRolByZaakUrlAndRolTypeUrl adapter ([c3343e1](https://github.com/wearefrank/zaakbrug/commit/c3343e12eb52bf059b25a459c6f78e7e2d64de5a))

## [1.21.1](https://github.com/wearefrank/zaakbrug/compare/v1.21.0...v1.21.1) (2024-09-03)

### 🐛 Bug Fixes

* updateZaak when deleting an existing gerelateerde and add new one back on the same role performs add action before delete action resulting in an error when only 1 of that roltype is allowed ([34ff319](https://github.com/wearefrank/zaakbrug/commit/34ff319fd990a824b885bcd473ff4fe8160537a6))

### ✅ Tests

* change delete&add roles testcase to use initiator instead so that order of operation is checked aswell ([ac0cade](https://github.com/wearefrank/zaakbrug/commit/ac0cadea0d99fcf3ab8d0c2d5fc5a1a66d5bf297))

## [1.21.0](https://github.com/wearefrank/zaakbrug/compare/v1.20.2...v1.21.0) (2024-08-30)

### 🍕 Features

* valueOverrides in the translation profiles can now also be applied to case roles ([17e9371](https://github.com/wearefrank/zaakbrug/commit/17e937132c1eafd3b942df7887ada0b197d083ef))

### 🐛 Bug Fixes

* case rol geboortedatum throws error when absent or empty in input message ([d11a769](https://github.com/wearefrank/zaakbrug/commit/d11a7697a22a01502183f3984db2b0a155147889))
* map annIdentificatie field from zds to zgw ([38378da](https://github.com/wearefrank/zaakbrug/commit/38378da451065f086911041ac54db7f30e2d6722))

### 🧑‍💻 Code Refactoring

* add omschrijving and omschrijvingGeneriek to case role zds to zgw translation to match the zaken api and to retain roltype information ([57b7625](https://github.com/wearefrank/zaakbrug/commit/57b7625d98d74872ea9af508baf6d528121ad30f))
* case role betrokkkeneInformatie translation removes empty elements only where appropriate now instead of skipping all empty element always ([0811ce7](https://github.com/wearefrank/zaakbrug/commit/0811ce702dc780f60d96a9ebc7666995999a018f))
* move zgw api envelope unwrap to the adapter responsible for making the api call ([8113511](https://github.com/wearefrank/zaakbrug/commit/81135115daa3609fb5f96d8953c0c84e35b47259))
* rewrite of xslt responsible for merging the 2 object updateZaak variant to the 1 object variant ([667abae](https://github.com/wearefrank/zaakbrug/commit/667abae49d1b5ecda6159129face40b3c9e6594d))
* xsd for correctly converting a case from xml to json changed to contain only the element which it, so that the ordering of elements is no longer neccesary ([babe98b](https://github.com/wearefrank/zaakbrug/commit/babe98bd79bbad3350dcd6d58707b7d1bae98cc0))
* xsd's for correctly converting xml to json changed to contain element which require it, so that the ordering of elements in no longer necessary ([522acf3](https://github.com/wearefrank/zaakbrug/commit/522acf348da434665158a7096e7a0478fa3aed03))

### ✅ Tests

* e2e testcases for valueOverrides system ([a8206cf](https://github.com/wearefrank/zaakbrug/commit/a8206cf02ab5c8aa9689e53181a145cdf7588357))
* larva testcases for validating valueOverrides related adapters and xslt's ([9f3f960](https://github.com/wearefrank/zaakbrug/commit/9f3f9600e75b82eb0f8e3b2ba488dcb72db94a3a))

### 🤖 Build System

* **dependencies:** bump the docusaurus group across 1 directory with 6 updates ([#433](https://github.com/wearefrank/zaakbrug/issues/433)) ([9662a51](https://github.com/wearefrank/zaakbrug/commit/9662a51be17fd219ed50e2d6852c689d7a450fd9))
* **dependencies:** bump the github-actions group across 1 directory with 4 updates ([#435](https://github.com/wearefrank/zaakbrug/issues/435)) ([b044ba2](https://github.com/wearefrank/zaakbrug/commit/b044ba2cc832c05a867054387856bcbe3ea540eb))

## [1.20.2](https://github.com/wearefrank/zaakbrug/compare/v1.20.1...v1.20.2) (2024-07-26)

### 🤖 Build System

* **dependencies:** bump the github-actions group with 2 updates ([#426](https://github.com/wearefrank/zaakbrug/issues/426)) ([5e2df91](https://github.com/wearefrank/zaakbrug/commit/5e2df91ebf68b259f3d7f03ce993d7c3aafb66f3))

### 🔁 Continuous Integration

* use waf bot pat token for bump-ff-version workflow due to permission issue with ci checks in the created pr ([1794919](https://github.com/wearefrank/zaakbrug/commit/17949192cc76e2613161e4267e02779428be3fd0))

## [1.20.1](https://github.com/wearefrank/zaakbrug/compare/v1.20.0...v1.20.1) (2024-07-19)

### 🔁 Continuous Integration

* automatically bump the Frank!Framework version on a weekly basis ([#301](https://github.com/wearefrank/zaakbrug/issues/301)) ([bad76bd](https://github.com/wearefrank/zaakbrug/commit/bad76bd7d5b238a73059181864cdb46eaa4904c1))

## [1.20.0](https://github.com/wearefrank/zaakbrug/compare/v1.19.16...v1.20.0) (2024-07-17)

### 🍕 Features

* new case closing behavior that skips an endstatus in actualiseerZaakStatus so that a following updateZaak can close the case by setting the enddate ([#424](https://github.com/wearefrank/zaakbrug/issues/424)) ([1110d72](https://github.com/wearefrank/zaakbrug/commit/1110d72efd1f5c2c8c880042dadb314479625c9b))

## [1.19.16](https://github.com/wearefrank/zaakbrug/compare/v1.19.15...v1.19.16) (2024-07-16)

### 🐛 Bug Fixes

* defaultProfile not being used when there is no zaaktype specific translation profile configured ([#402](https://github.com/wearefrank/zaakbrug/issues/402)) ([179c468](https://github.com/wearefrank/zaakbrug/commit/179c468b3f8b77e065e06c36a98ed1204281fbc0))
* updateZaak incorrectly distinguishes roles due to 'authentiek' dataloss in translation resulting in attempt to add as new role ([#418](https://github.com/wearefrank/zaakbrug/issues/418)) ([266d9ca](https://github.com/wearefrank/zaakbrug/commit/266d9ca47483353291dd1653699f55343c1279a4))

### 🤖 Build System

* **dependencies:** bump the github-actions group across 1 directory with 3 updates ([#422](https://github.com/wearefrank/zaakbrug/issues/422)) ([77ed198](https://github.com/wearefrank/zaakbrug/commit/77ed198e34ef9bca04a7606cca8f74926f575747))

## [1.19.15](https://github.com/wearefrank/zaakbrug/compare/v1.19.14...v1.19.15) (2024-07-10)

### 🐛 Bug Fixes

* return error closest to the source and return all nested errors ([#416](https://github.com/wearefrank/zaakbrug/issues/416)) ([c8c35a8](https://github.com/wearefrank/zaakbrug/commit/c8c35a807d31d241f3d745efe99c82a2eab25767))

### 🧑‍💻 Code Refactoring

* wrap zakla01 response xslt should not contain any zgw to zds translations ([#394](https://github.com/wearefrank/zaakbrug/issues/394)) ([e748a54](https://github.com/wearefrank/zaakbrug/commit/e748a548924f48da922389d1ec6c4a5adead1c84))

### 🤖 Build System

* **dependencies:** bump the github-actions group with 6 updates ([#411](https://github.com/wearefrank/zaakbrug/issues/411)) ([4909eb2](https://github.com/wearefrank/zaakbrug/commit/4909eb2808982cdda033e9bfd5e822794eec4559))
* **dependencies:** bump typescript ([#410](https://github.com/wearefrank/zaakbrug/issues/410)) ([74652fa](https://github.com/wearefrank/zaakbrug/commit/74652fa08d19594194052c5de73971fd89b63fbe))

## [1.19.14](https://github.com/wearefrank/zaakbrug/compare/v1.19.13...v1.19.14) (2024-07-03)

### 🐛 Bug Fixes

* creeerZaak attempts to also delete the case when the post case call fails and there is nothing to delete ([#408](https://github.com/wearefrank/zaakbrug/issues/408)) ([7956c0b](https://github.com/wearefrank/zaakbrug/commit/7956c0b30b2d2da7a429f5cd4a2da654b62649c1))
* zaaktype not found throwing incorrect generic error ([fba69b4](https://github.com/wearefrank/zaakbrug/commit/fba69b49fc00cd4c409f385142c275ab62d23e58))

### 🔥 Performance Improvements

* implement simple cache for authorization token generation so that tokens are reused until the tokens expires ([22be3a0](https://github.com/wearefrank/zaakbrug/commit/22be3a00040bff708afdf00effe8878b4df61ed1))

### 🔁 Continuous Integration

* configure dependabot to update github-actions on a weekly basis ([01688c0](https://github.com/wearefrank/zaakbrug/commit/01688c0093910eee9bf1474006728f7dbe952a52))
* **dependencies:** lock ci-cd-template workflow versions to commit hash instead of main branch ([3cee5ca](https://github.com/wearefrank/zaakbrug/commit/3cee5ca6dcdd43c37f38f8f585a38498cdd0b437))

## [1.19.13](https://github.com/wearefrank/zaakbrug/compare/v1.19.12...v1.19.13) (2024-07-01)

### 🧑‍💻 Code Refactoring

* correct ibisdoc.xsd reference to frankconfig.xsd ([b250021](https://github.com/wearefrank/zaakbrug/commit/b250021381c22beebe789839591cfb4676e1d174))

## [1.19.12](https://github.com/wearefrank/zaakbrug/compare/v1.19.11...v1.19.12) (2024-06-27)

### 🐛 Bug Fixes

* adding heeftBetrekkingOp in an updateZaak action throws error ([b5e8572](https://github.com/wearefrank/zaakbrug/commit/b5e85727b38dc1c24e8b4053ae566f88396f4764))

### ✅ Tests

* add testcases for heeftBetrekkingOp with and without address ([4eff2ca](https://github.com/wearefrank/zaakbrug/commit/4eff2ca88132e2de3fdf603a63e605b943780938))

## [1.19.11](https://github.com/wearefrank/zaakbrug/compare/v1.19.10...v1.19.11) (2024-06-25)

### 🤖 Build System

* **dependencies:** bump docusaurus version to 2.4.0 ([bb5ac6b](https://github.com/wearefrank/zaakbrug/commit/bb5ac6b9d528ecc375baa48bb7700f7de2992951))

## [1.19.10](https://github.com/wearefrank/zaakbrug/compare/v1.19.9...v1.19.10) (2024-06-25)

### 🧑‍💻 Code Refactoring

* replace authorization custom code with standard ff pipes ([#393](https://github.com/wearefrank/zaakbrug/issues/393)) ([1d6671b](https://github.com/wearefrank/zaakbrug/commit/1d6671b11481d69c4694bd0ff8dc4009dd859957))

## [1.19.9](https://github.com/wearefrank/zaakbrug/compare/v1.19.8...v1.19.9) (2024-06-25)

### 🐛 Bug Fixes

* geefLijstZaakdocumenten should not return an error response when the zaak can't be found ([#395](https://github.com/wearefrank/zaakbrug/issues/395)) ([d4ce003](https://github.com/wearefrank/zaakbrug/commit/d4ce0037296ca861dfed89df99680fcab7a5633a))

## [1.19.8](https://github.com/wearefrank/zaakbrug/compare/v1.19.7...v1.19.8) (2024-06-21)

### 🐛 Bug Fixes

* document status is not being translated from zgw to zds ([#355](https://github.com/wearefrank/zaakbrug/issues/355)) ([8b06c39](https://github.com/wearefrank/zaakbrug/commit/8b06c39881758c1a404d169282dfcc32b75c80c1))

## [1.19.7](https://github.com/wearefrank/zaakbrug/compare/v1.19.6...v1.19.7) (2024-06-21)

### 🐛 Bug Fixes

* authentiek element is not taken into account when identifying a gerelateerde on a role during updateZaak ([70be86d](https://github.com/wearefrank/zaakbrug/commit/70be86dee915beee5efe9e7b4ff93a27868efe68))
* updateZaak fails when deleting a gerelateerde and in the same updateZaak add a new gerelateerde on the same roltype ([7b532b9](https://github.com/wearefrank/zaakbrug/commit/7b532b903fcbf8a748fff6b819bbc98de0118878))
* updateZaak not able to handle multiple gerelateerde for a single roltype ([a9d6607](https://github.com/wearefrank/zaakbrug/commit/a9d6607eb4dd2fdbd42ba20a8a0be2106ff59b71))
* updateZaak sometimes incorrectly detects changes to case roles resulting in unnecessary delete and post calls ([8825c6c](https://github.com/wearefrank/zaakbrug/commit/8825c6c48ea951ee3682a367123e4adf195ed8e4))

### 🧑‍💻 Code Refactoring

* updateZaak uses verwerkingsoort when processing case roles ([4bb2da2](https://github.com/wearefrank/zaakbrug/commit/4bb2da29177f9be4ec3b1f55f9dbaac1cf0662af))
* verwerkingssoort 'I' on case roles are processed as 'T' if the role is not present on the case ([#285](https://github.com/wearefrank/zaakbrug/issues/285)) ([1ec7016](https://github.com/wearefrank/zaakbrug/commit/1ec701606c0f0bb3c82d593745f3110f33b2c9c7))

### ✅ Tests

* add assertions to check for regression on various geefLijstZaakdocumenten and geefZaakDetails steps [skip ci] ([3b2bfbf](https://github.com/wearefrank/zaakbrug/commit/3b2bfbf540c36b5c2f606cb7e07cd9012bbe4c57))
* add testcases for all different combinations of verwerkingsoort on case roles ([f88f0a6](https://github.com/wearefrank/zaakbrug/commit/f88f0a6a299c5a760ad037c3b46faf9f63a81efd))
* add testcases for deleting, changing and adding multiple gerelateerde on a single roltype ([e7b68a1](https://github.com/wearefrank/zaakbrug/commit/e7b68a1119d9ba2fc4ea75343302f1d88dd3b7f2))

## [1.19.6](https://github.com/wearefrank/zaakbrug/compare/v1.19.5...v1.19.6) (2024-06-11)

### 📝 Documentation

* replace broken link how-to-set-or-override-properties with placeholder ([396715e](https://github.com/wearefrank/zaakbrug/commit/396715ed738a5a3eb85951ea2a47bf5797adc5b0))

## [1.19.5](https://github.com/wearefrank/zaakbrug/compare/v1.19.4...v1.19.5) (2024-06-11)

### 📝 Documentation

* introduce docusaurus documentation website hosted as github pages ([4a784b3](https://github.com/wearefrank/zaakbrug/commit/4a784b3cddd10151b78548da734ffe7f5032e585))

## [1.19.4](https://github.com/wearefrank/zaakbrug/compare/v1.19.3...v1.19.4) (2024-06-04)

### 🐛 Bug Fixes

* delete created zaak during creeerzaak when an error occurs so that it can be retried ([#326](https://github.com/wearefrank/zaakbrug/issues/326)) ([8f7d79d](https://github.com/wearefrank/zaakbrug/commit/8f7d79d8c0a93eb0dc3b3e918982da5b81ac1416))

## [1.19.3](https://github.com/wearefrank/zaakbrug/compare/v1.19.2...v1.19.3) (2024-06-03)

### 🐛 Bug Fixes

* return error feedback when a document is updated while it has status 'definitief' ([#354](https://github.com/wearefrank/zaakbrug/issues/354)) ([2eac6d5](https://github.com/wearefrank/zaakbrug/commit/2eac6d510ec9d4afd1078e081f32ad69f83f6893))

### 🔁 Continuous Integration

* remove conventional-commits preset version lock ([10629c9](https://github.com/wearefrank/zaakbrug/commit/10629c97c0a0de1b10dfbb157c700a0f8419a400))

## [1.19.2](https://github.com/wearefrank/zaakbrug/compare/v1.19.1...v1.19.2) (2024-05-31)


### 🧑‍💻 Code Refactoring

* add alpha3b and alpha3t to alpha conversion to language code conversion ([4f19cc4](https://github.com/wearefrank/zaakbrug/commit/4f19cc4907b69d3b7d772728197967a89206818a))


### ✅ Tests

* **larva:** add GetISO639Code xslt testcases for all variants of language code conversion ([8bd4e96](https://github.com/wearefrank/zaakbrug/commit/8bd4e96a675027614a83d61bb439fa0e577bf2b8))

## [1.19.1](https://github.com/wearefrank/zaakbrug/compare/v1.19.0...v1.19.1) (2024-05-14)


### 🐛 Bug Fixes

* incorrect reference to geefLijstZaakDocumenten in errormessage when retrieving a zaak by identificatie ([#300](https://github.com/wearefrank/zaakbrug/issues/300)) ([14217a6](https://github.com/wearefrank/zaakbrug/commit/14217a68055ae7b96f8a20e092723902fa026655))


### 🔁 Continuous Integration

* lock conventionalcommit preset version to major 7 due to breaking change ([6bbe734](https://github.com/wearefrank/zaakbrug/commit/6bbe734e3cb3daade68653c1e0863e768efd95c1))

## [1.19.0](https://github.com/wearefrank/zaakbrug/compare/v1.18.3...v1.19.0) (2024-05-01)


### 🍕 Features

* new test cases to test zaak closure have been added ([839cd48](https://github.com/wearefrank/zaakbrug/commit/839cd48c829329849834f34d6dac7c32864149f5))


### 🐛 Bug Fixes

* datumStatusGezet is added to zds:heeft mapping ([031e73f](https://github.com/wearefrank/zaakbrug/commit/031e73f0e470afa82a475762177d6eca9d80fb9b))
* eindDatum added to mapping xslt file ([39bbc64](https://github.com/wearefrank/zaakbrug/commit/39bbc64b34452f6cbde0c43245339fbbf93cc524))
* mapping zaakStatus in heeft element is fixed ([df01c05](https://github.com/wearefrank/zaakbrug/commit/df01c05e975343cafaa0fba91796246fcdf25402))
* the loop that is creating the profile object updated so that the loop continues instead of break in if block. ([2dbeb5c](https://github.com/wearefrank/zaakbrug/commit/2dbeb5c1487ab44da81a5c3ac4015b527fe2e08a))
* The test cases failing because of the bugs has been updated so that they fail and they disabled ([6dfa19f](https://github.com/wearefrank/zaakbrug/commit/6dfa19f0fec68f52876fa27fc05c980f25a5c116))

## [1.18.3](https://github.com/wearefrank/zaakbrug/compare/v1.18.2...v1.18.3) (2024-04-25)


### 🐛 Bug Fixes

* language format translation from alpha3-t(e.g. NLD) to alpha2(e.g. NL) not working ([#99](https://github.com/wearefrank/zaakbrug/issues/99)) ([f9bf8a2](https://github.com/wearefrank/zaakbrug/commit/f9bf8a2ed1f4eeb154d631d4ee61d80c291f6ac9))

## [1.18.2](https://github.com/wearefrank/zaakbrug/compare/v1.18.1...v1.18.2) (2024-04-22)


### 🐛 Bug Fixes

* ladybug zaak/document identificatie column sometimes not showing identificatie when it doesnt follow a specific format ([#303](https://github.com/wearefrank/zaakbrug/issues/303)) ([70451be](https://github.com/wearefrank/zaakbrug/commit/70451be6e5cd80c999eeb83143a5ed80729d77eb))

## [1.18.1](https://github.com/wearefrank/zaakbrug/compare/v1.18.0...v1.18.1) (2024-04-22)


### 🐛 Bug Fixes

* error when merging profile defaults when profileDefaults key is missing completely ([d7f3b7f](https://github.com/wearefrank/zaakbrug/commit/d7f3b7f7d026fc8efdc94561b3263fe636d17566))

## [1.18.0](https://github.com/wearefrank/zaakbrug/compare/v1.17.1...v1.18.0) (2024-04-18)


### 🍕 Features

* provide translation profile defaults for configuring common settings applying to all zaaktype related custom translation profiles ([#296](https://github.com/wearefrank/zaakbrug/issues/296)) ([81e9114](https://github.com/wearefrank/zaakbrug/commit/81e9114c827e8f9e91120ebf72cdfc043496d14d))

## [1.17.1](https://github.com/wearefrank/zaakbrug/compare/v1.17.0...v1.17.1) (2024-04-08)


### 🧑‍💻 Code Refactoring

* move processing of zaak relationships to the end of creeerZaak and updateZaak so that the more critical resultaat and statussen are processed first ([#298](https://github.com/wearefrank/zaakbrug/issues/298)) ([0ed1615](https://github.com/wearefrank/zaakbrug/commit/0ed1615027122fc5abc0f2176f03d1e633dc46a4))

## [1.17.0](https://github.com/wearefrank/zaakbrug/compare/v1.16.2...v1.17.0) (2024-04-04)


### 🍕 Features

* Ladybug database storage for persisting reports ([469c071](https://github.com/wearefrank/zaakbrug/commit/469c071d199f174fd93ce036554c4bc0447a213f))


### 🐛 Bug Fixes

* Ladybug reports get stuck on "in progress" when an error occurs in the pipeline ([e65ce68](https://github.com/wearefrank/zaakbrug/commit/e65ce68101eb2a6b9ac14fb48a227b82e0815185))

## [1.16.2](https://github.com/wearefrank/zaakbrug/compare/v1.16.1...v1.16.2) (2024-03-27)


### 🤖 Build System

* upgrade to java 17 & use frank!framework base docker image instead of building a custom image ([#237](https://github.com/wearefrank/zaakbrug/issues/237)) ([25fcee7](https://github.com/wearefrank/zaakbrug/commit/25fcee75e9cb410c62de346b11711d4052be7511))

## [1.16.1](https://github.com/wearefrank/zaakbrug/compare/v1.16.0...v1.16.1) (2024-03-25)


### 🧑‍💻 Code Refactoring

* processing of zds statusses is no longer done in parallel ([#294](https://github.com/wearefrank/zaakbrug/issues/294)) ([64ad31f](https://github.com/wearefrank/zaakbrug/commit/64ad31f45cc4b52aaa2f3e28982015792799c04c))

## [1.16.0](https://github.com/wearefrank/zaakbrug/compare/v1.15.15...v1.16.0) (2024-03-20)


### 🍕 Features

* translation profile translation value overrides ([#277](https://github.com/wearefrank/zaakbrug/issues/277)) ([4dfd283](https://github.com/wearefrank/zaakbrug/commit/4dfd2835cdc0df62335436ce35e74d2bafba771a))

## [1.15.15](https://github.com/wearefrank/zaakbrug/compare/v1.15.14...v1.15.15) (2024-02-27)


### 🧑‍💻 Code Refactoring

* add actualiseerZaakStatus support for old and new state in input instead of just the new state ([#274](https://github.com/wearefrank/zaakbrug/issues/274)) ([30a0ecf](https://github.com/wearefrank/zaakbrug/commit/30a0ecf77aa6c94b0bf7fc968327a6212fed635c))

## [1.15.14](https://github.com/wearefrank/zaakbrug/compare/v1.15.13...v1.15.14) (2024-02-27)


### 🐛 Bug Fixes

* zaak betalingsindicatie is not being translated ([#273](https://github.com/wearefrank/zaakbrug/issues/273)) ([3c1505a](https://github.com/wearefrank/zaakbrug/commit/3c1505aef804deb1889ee01f2f444b1dc0937f64))

## [1.15.13](https://github.com/wearefrank/zaakbrug/compare/v1.15.12...v1.15.13) (2024-02-27)


### 🧑‍💻 Code Refactoring

* replace jwt custom code with new jwt pipe ([#278](https://github.com/wearefrank/zaakbrug/issues/278)) ([5a6b141](https://github.com/wearefrank/zaakbrug/commit/5a6b1416f737b847d369075fee4a0cf0893491c5))

## [1.15.12](https://github.com/wearefrank/zaakbrug/compare/v1.15.11...v1.15.12) (2024-02-26)


### 🔁 Continuous Integration

* include buildinfo.properties commit assets on release ([5b68949](https://github.com/wearefrank/zaakbrug/commit/5b68949efaf9cd89c09bfece03ad4d0e02805d5f))
* only run cicd on push to master when new release ([00b0345](https://github.com/wearefrank/zaakbrug/commit/00b03455c47a04176d4543de8ac8a09ecafb76bc))
* update deprecated version export command with the new github way ([7f1e471](https://github.com/wearefrank/zaakbrug/commit/7f1e4719d4ca2438e3ecb85d996c1f7d191dab47))

## [1.15.11](https://github.com/wearefrank/zaakbrug/compare/v1.15.10...v1.15.11) (2024-02-26)


### 🔁 Continuous Integration

* pass github token excplicitly to helm chart update workflow ([#279](https://github.com/wearefrank/zaakbrug/issues/279)) ([eaca9d4](https://github.com/wearefrank/zaakbrug/commit/eaca9d422b3dfc7e6a7de7faa8e4623af7c3aa0d))
* switch to generic waf cicd templates ([#276](https://github.com/wearefrank/zaakbrug/issues/276)) ([92a061d](https://github.com/wearefrank/zaakbrug/commit/92a061dad640292de7f1e82a7e497738b15b2c74))

## [1.15.10](https://github.com/wearefrank/zaakbrug/compare/v1.15.9...v1.15.10) (2024-02-23)


### 🤖 Build System

* **dependencies:** bump f!f version to 8.1.0-20240221.213323 ([d8ee34b](https://github.com/wearefrank/zaakbrug/commit/d8ee34b5b9d9d19936087051181229037f7ed6f9))

## [1.15.9](https://github.com/wearefrank/zaakbrug/compare/v1.15.8...v1.15.9) (2024-02-12)


### 🐛 Bug Fixes

* eindstatus duplicate check used less precise zaak einddatum instead of eindstatus datumstatusgezet resulting in duplicate check false positives ([#267](https://github.com/wearefrank/zaakbrug/issues/267)) ([ce9d754](https://github.com/wearefrank/zaakbrug/commit/ce9d7548faeac37771c13986bedeb30de9d943e7))

## [1.15.8](https://github.com/wearefrank/zaakbrug/compare/v1.15.7...v1.15.8) (2024-02-02)


### 🧑‍💻 Code Refactoring

* nest previous errors when throwing a new error so that information from more the specific errors is not lost ([#261](https://github.com/wearefrank/zaakbrug/issues/261)) ([3d06c31](https://github.com/wearefrank/zaakbrug/commit/3d06c312c7763ae21c92395039afec4212ff3772))

## [1.15.7](https://github.com/wearefrank/zaakbrug/compare/v1.15.6...v1.15.7) (2024-01-31)


### 🤖 Build System

* move default values from configuration level to instance level ([#265](https://github.com/wearefrank/zaakbrug/issues/265)) ([4aba4c9](https://github.com/wearefrank/zaakbrug/commit/4aba4c9d2b3b64215aa96cfdf625f8872276b554))

## [1.15.6](https://github.com/wearefrank/zaakbrug/compare/v1.15.5...v1.15.6) (2024-01-26)


### 🔥 Performance Improvements

* forEachChildElementPipe pipes execute in parallel without ignoring errors ([#264](https://github.com/wearefrank/zaakbrug/issues/264)) ([c4a975b](https://github.com/wearefrank/zaakbrug/commit/c4a975befec4802ae8e8aff889a6dcaa42d42c13))

## [1.15.5](https://github.com/wearefrank/zaakbrug/compare/v1.15.4...v1.15.5) (2024-01-26)


### ✅ Tests

* openzaak in development docker-compose bumped to 1.10.3 and testcases updated ([#263](https://github.com/wearefrank/zaakbrug/issues/263)) ([107d98d](https://github.com/wearefrank/zaakbrug/commit/107d98d56991695c053fe62dd1279dcd654b26ee))

## [1.15.4](https://github.com/wearefrank/zaakbrug/compare/v1.15.3...v1.15.4) (2024-01-18)


### 🤖 Build System

* **dependencies:** bump f!f version to 8.1.0-20240111.192324 ([7807661](https://github.com/wearefrank/zaakbrug/commit/780766140d0e95470247b6fa3171e81d8e0ed884))

## [1.15.3](https://github.com/wearefrank/zaakbrug/compare/v1.15.2...v1.15.3) (2024-01-18)


### 🐛 Bug Fixes

* zaak kenmerk with empty kenmerk or bron causing zgw api validation error will now be ignored ([1b62a26](https://github.com/wearefrank/zaakbrug/commit/1b62a265b18c78731e9ac013469da853a1cc4c36))
* zaak kenmerken in creeerZaak are not translated to zgw ([e0d26e8](https://github.com/wearefrank/zaakbrug/commit/e0d26e89c9c2ef2e98f5126c0b62bcfb4cc62a97))
* zaak kenmerken not properly translated in creeerZaak updateZaak and geefZaakDetails ([89f991e](https://github.com/wearefrank/zaakbrug/commit/89f991ed44ac204d07563c375660a97dc74005ad))


### 🧑‍💻 Code Refactoring

* remove obsolete zgw zaak translation ([20cf1a5](https://github.com/wearefrank/zaakbrug/commit/20cf1a5da013393534329fa3975fc323f6525486))


### ✅ Tests

* unit test zaak kenmerken happyflow and empty sub-elements cases ([4cf16ad](https://github.com/wearefrank/zaakbrug/commit/4cf16ad1364cf9040c12d1fe6cf36d83effa7bcf))

## [1.15.2](https://github.com/wearefrank/zaakbrug/compare/v1.15.1...v1.15.2) (2024-01-16)


### ✅ Tests

* move each e2e test into it's own testsuite for more intuitive way running tests with or without setup and teardown ([#252](https://github.com/wearefrank/zaakbrug/issues/252)) ([72151b2](https://github.com/wearefrank/zaakbrug/commit/72151b2dec762a2bc9268959027cbb6643037d3c))

## [1.15.1](https://github.com/wearefrank/zaakbrug/compare/v1.15.0...v1.15.1) (2024-01-15)


### 🔁 Continuous Integration

* lock semantic-release to 22 major ([#256](https://github.com/wearefrank/zaakbrug/issues/256)) ([be0f219](https://github.com/wearefrank/zaakbrug/commit/be0f219ffaf94dabe068adef3deb0b9489901478))

## [1.15.0](https://github.com/wearefrank/zaakbrug/compare/v1.14.3...v1.15.0) (2024-01-11)


### 🍕 Features

* add column to ladybug ([#251](https://github.com/wearefrank/zaakbrug/issues/251)) ([c3f1708](https://github.com/wearefrank/zaakbrug/commit/c3f170864a024fb4819cf4c819cdc80c16af429f))

## [1.14.3](https://github.com/wearefrank/zaakbrug/compare/v1.14.2...v1.14.3) (2024-01-11)


### 🐛 Bug Fixes

* error handling Pipe ResultWithErrorMessage fails on TypeRolOmschrijving ([#255](https://github.com/wearefrank/zaakbrug/issues/255)) ([6d9db22](https://github.com/wearefrank/zaakbrug/commit/6d9db22db4931878dc8810eaca148168f7ba298a))

## [1.14.2](https://github.com/wearefrank/zaakbrug/compare/v1.14.1...v1.14.2) (2024-01-08)


### 🐛 Bug Fixes

* CreeerZaak does not result in an error when there is no role ([#253](https://github.com/wearefrank/zaakbrug/issues/253)) ([7739146](https://github.com/wearefrank/zaakbrug/commit/77391467e9745911710aa199318707cefb71beee))

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
