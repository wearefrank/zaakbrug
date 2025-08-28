---
sidebar_position: 100
---

# Configure Value Overrides
The translations from ZDS/StUF to ZGW are made to be as neutral as possible. With value overrides it is possible to diverge from the generic translation defaults or add static properties.

Value overrides can be configured in `src/main/configurations/Translate/profiles.json` or in the `zaakbrug.profiles` section of the Helm chart.

The keys for the the different properties can be deducted from the OpenApi specification of the API's. 
The keys follow the following format: `zgw.<api-name>.<collection-name>.<object-name>.<property>`. For example the key for the zaak property `betalingsindicatie` would be: `zgw.zaken-api.zaken.zaak.betalingsindicatie`. 

By default a value override is only applied if the property's value after the translation from ZDS/StUF to ZGW is **not present, empty string or null**.

Currently this feature implemented for:
- (zaken-api) zaak
- (zaken-api) rol
- (zaken-api) zaakobject

### Example: Override zaak.betalingsindicatie to use 'nvt' as default value.
The effect of the value override in this example would be that the zaak property `betalingsindicatie` will be set to `nvt`, only if this value is not already provided in the incoming ZDS message.

In the translation profile this would look like this:
```json
{
    "profile": [
        {
            "zaakTypeIdentificatie": "example",
            "valueOverrides": [
                {
                    "key": "zgw.zaken-api.zaken.zaak.betalingsindicatie",
                    "value": "nvt"
                }
            ]
        }
    ]
}
```

## Dynamic Value Overrides
The basic value overrides mechanism takes a static pre-configured value from the translation profile as override value. Dynamic value overrides allow the value to be determined dynamicly during runtime. This could be an value from the incoming ZDS message for example. The generic syntax to use in the value override's `value` field is as follows:
```
${<context>:<action>}
```

### Value From StUF:extraElement
To use a value from a StUF:extraElement, the `extraElementen` context can be used with the above syntax. When using the `extraElementen` context, the **action** part of the syntax will be the name of the extra element.

Depending on what resource the value override is applied to, the StUF:extraElement will only be looked for in that relevant part of the incoming ZDS message. This means that a StUF:extraElement named `kvkNummer` on a role, is only available to that specific role. A StUF:extraElement value override on the `zgw.zaken-api.rollen.rol` resource cannot use any StUF:extraElement on any other resource. In short; A value override on the case can only use a StUF:extraElement that is present on the case itself; A value override on a role can only use a StUF:extraElement from that specific role.

### Example: Override nietNatuurlijkPersoon role 'annIdentificatie' field with StUF:extraElement naam="kvkNummer".

In the translation profile it would look like this:
```json
{
    "profile": [
        {
            "zaakTypeIdentificatie": "example",
            "valueOverrides": [
                // highlight-start
                {
                    "key": "zgw.zaken-api.rollen.rol.betrokkeneIdentificatie.annIdentificatie",
                    "value": "${extraElementen:kvkNummer}",
                    "condition": "true()"
                }
                // highlight-end
            ]
        }
    ]
}
```

The incoming ZDS message might look something like this:
```xml
<ZKN:zakLk01>
       ...
    <ZKN:object StUF:entiteittype="ZAK" StUF:verwerkingssoort="T">
        ...
        <ZKN:heeftAlsInitiator StUF:entiteittype="ZAKBTRINI" StUF:verwerkingssoort="T">
            <ZKN:gerelateerde>
                <ZKN:nietNatuurlijkPersoon StUF:entiteittype="NNP" StUF:verwerkingssoort="T">
                    <BG:inn.nnpId>823288444</BG:inn.nnpId>
                    <BG:authentiek StUF:metagegeven="true">N</BG:authentiek>
                    <BG:statutaireNaam>SjaakZnZaak</BG:statutaireNaam>
                    <BG:inn.rechtsvorm>Eenmanszaak</BG:inn.rechtsvorm>
                    <BG:bezoekadres>
                    <BG:aoa.identificatie>0091200000046730</BG:aoa.identificatie>
                    <BG:authentiek StUF:metagegeven="true">J</BG:authentiek>
                    <BG:wpl.woonplaatsNaam>Sneek</BG:wpl.woonplaatsNaam>
                    <BG:gor.openbareRuimteNaam>Marktstraat</BG:gor.openbareRuimteNaam>
                    <BG:gor.straatnaam>Marktstraat</BG:gor.straatnaam>
                    <BG:aoa.postcode>8601CR</BG:aoa.postcode>
                    <BG:aoa.huisnummer>15</BG:aoa.huisnummer>
                    <BG:aoa.huisletter xsi:nil="true" StUF:noValue="geenWaarde"/>
                    <BG:aoa.huisnummertoevoeging/>
                    <BG:inp.locatiebeschrijving xsi:nil="true" StUF:noValue="geenWaarde"/>
                    </BG:bezoekadres>
                </ZKN:nietNatuurlijkPersoon>
            </ZKN:gerelateerde>
            // highlight-start
            <StUF:extraElementen>
                <StUF:extraElement naam="kvkNummer">12345678</StUF:extraElement>
            </StUF:extraElementen>
            // highlight-end
        </ZKN:heeftAlsInitiator>
        ...
    </ZKN:object>
</ZKN:zakLk01>

```

This results in ZaakBrug taking the value from StUF:extraElement named `kvkNummer` present on the role in question from the incoming ZDS message. Before the translated role is passed to the ZGW API's, the `annIdentificatie` field under betrokkeneIdentificatie is filled with this value.

When retrieving a case with this role with a `geefZaakDetails` ZDS message for example, the reverse is done aswell. In the response message, contained within the role in question, an StUF:extraElement named `kvkNummer` will be added with the value taken from `annIdentificatie` field under betrokkeneIdentificatie.

:::warning
    Currently it is necessary to add `"condition": "true()"` to every dynamic value override from StUF:extraElement. 
:::