![zaakbrug-banner-small.png](/docs/picturesReadme/zaakbrug-banner-small.png)

Successor of [Open-ZaakBrug](https://sudwest-fryslan.github.io/OpenZaakBrug), an app for Dutch municipalities that supports the transition from "zaak- en documentatieservices" (zds) to "zaakgericht werken" (zgw).

Dutch municipalities provide services that are delivered many times. An example of such a service is to provide passports. This service is delivered many times because each citizen needs a passport or an ID card. An instance of a service that is provided multiple times is referred by the Dutch word "zaak" (case).

There is a new specification named "zaakgericht werken" (zgw) for case register systems. Zgw is part of the [Common Ground specification](https://vng.nl/artikelen/common-ground) for software used by Dutch municipalities. Zgw will replace an old specification called "zaak- en documentatieservices" (zds). The municipality of Súdwest Fryslân wants to migrate to the zgw standard without having to invest in zds interfaces. To this end, the municipality has built the system Open-ZaakBrug (brug means bridge). It acts as an interface between a zgw case register system on the one hand and zds systems connecting to the case register system on the other hand. The Open-ZaakBrug source code is hosted on [GitHub Sudwest-Fryslan/OpenZaakBrug](https://github.com/Sudwest-Fryslan/OpenZaakBrug). For a comparison of zgw and zds see [API-standaarden voor Zaakgericht Werken vergeleken met de Zaak- en Documentservices](https://vng.nl/sites/default/files/2022-03/20200703%20-%20Vergelijking%20ZGW%20APIs%20en%20ZDS_v1.0.pdf#:~:text=De%20Zaak-%20en%20Documentservices%20%28ZDS%29-standaard%20beschrijft%20hoe%20een,vakapplicatie%20en%20deze%20worden%20gekopieerd%20naar%20het%20zaaksysteem).

This project, ZaakBrug, is meant to be a successor of Open-ZaakBrug. It leverages the [Frank!Framework](https://wearefrank.nl/en/framework) and its debugger Ladybug. The debugger shows for each incoming request which steps are executed to process the message. If there are errors, this information can be used for easy debugging. ZaakBrug does not only connect zds systems with case register system [OpenZaak](https://openzaak.org/en), but with any case register system that implements zgw.

## Compatibility
ZDS 1.1 functionality is supported with the exception of the `geefZaakstatus_Lv01` and `maakZaakdocument_Lk01` messages. Additional elements from RGBZ/StUF-Zaken are partially supported. Due to the broadness of RGBZ/StUF-Zaken, support for additional elements is implemented on-demand. 

Raw StUF-Zaken messages are officially not supported and therefor not part of automated testing, but ZaakBrug does accept them and does a best-effort translation. Simple use-cases such as creating a case or adding a document are usually translated without issue.

| Webservice Operation | Status |
| --------------- | --- |
| ZDS 1.1 - genereerZaakIdentificatie_Di02 | supported |
| ZDS 1.1 - creeerZaak_Lk01 | supported |
| ZDS 1.1 - updateZaak_Lk01 | supported |
| ZDS 1.1 - actualiseerZaakstatus_Lk01 | supported |
| ZDS 1.1 - geefZaakdetails_Lv01 | supported |
| ZDS 1.1 - geefZaakstatus_Lv01 | not supported |
| ZDS 1.1 - genereerDocumentIdentificatie_Di02 | supported |
| ZDS 1.1 - geefLijstZaakdocumenten_Lv01 | supported |
| ZDS 1.1 - maakZaakdocument_Lk01 | not supported |
| ZDS 1.1 - voegZaakdocumentToe_Lk01 | supported |
| ZDS 1.1 - geefZaakdocumentLezen_Lv01 | supported |
| ZDS 1.1 - geefZaakdocumentbewerken_Di02 | supported |
| ZDS 1.1 - updateZaakdocument_Di02 | supported |
| ZDS 1.1 - cancelCheckout_Di02 | supported |
| StUF-Zkn 3.1 zakLv01 | best-effort |
| StUF-Zkn 3.1 zakLk01 | best-effort |
| StUF-Zkn 3.1 edcLk01 | best-effort |

# Starting ZaakBrug
These methods show how to start ZaakBrug with the bare minimum and without any configuration. These steps are meant as a quick-start and are not production-ready. Refer to [ZaakBrug Documentation](https://docs.zaakbrug.nl) for more information on using and configuring ZaakBrug.

## Docker Compose
It is recommended to run ZaakBrug with Docker. Ensure that Docker is installed on your computer and proceed as follows:
1. Clone GitHub project https://github.com/wearefrank/zaakbrug if you have not done so yet.
1. Run the following command in the root of the checked out repository:
   ```bash
   docker compose up
   ```
1. Access the Frank!Console by navigating to `http://zaakbrug.localtest.me:8080/`, `http://frank.localtest.me:8080/` or `http://localhost:8080/` in the browser.
1. (Optional) Access the Frank!Flow by navigating to `http://frank-flow.localtest.me:8090/` in the browser.

## Helm
Refer to [ZaakBrug Helm Chart](https://wearefrank.github.io/charts/zaakbrug).

# Configuration
## Zaak- and Documentidentificatie
The properties `zaakbrug.zgw.zaak-identificatie-template` and `zaakbrug.zgw.document-identificatie-template` can be configured to specify how the zaak- and documentidentificatie should be generated and formatted.
The syntax for variable substitution is as follows {[variable-name][:formatting-string]} 
| Variable | Description |
| --- | --------- |
| id | Auto-incrementing identifier with 'D' as formatting option, indicating the amount of digits. <br/>_Example:_ `{id:D5}` with id-123 will result in '00123'. |
| datetime | The current date and time with '[Y]' as formatting option, according to [XSLT datetime formatting](https://www.oreilly.com/library/view/xslt-2nd-edition/9780596527211/ch04s05.html). <br/> _Examples:_ <ul><li>`{datetime:[Y]}` with datetime=14-03-2023 produces '2023'</li><li>`{datetime:[Y0001]}` with datetime=14-03-2023 produces '2023'</li><li>`{datetime:[Y][M][D]}` with datetime=14-03-2023 produces '2023314'</li><li>`{datetime:[Y0001][M01][D01]}` with datetime=14-03-2023 produces '20230314'</li><li>`{datetime:[Y][M01][D]}` with datetime=14-03-2023 produces '20230314'</li></ul>

## Translation Profiles

### Closing zaak with updateZaak message
Closing a zaak' refers to the action of setting the EindStatus (Last Status) to the zaak itself. EindStatus refers to a status created with a Status Type where the 'isEindStatus' field is set to true. When a zaak has such EindStatus then it means the zaak is closed.
To be able to close a zaak, the zaak must have a Resultaat(Result) value as well. In case the zaak doesn't have a Resultaat value, then one of the dummy values in Profile.json file (if exists) will be used as explained below.

There are three ways of closing a zaak.

1) Setting EindDatum (End Date)
When EindDatum field is set in updateZaak message and if the zaak already has a Resultaat then EindStatus (Last Status) is automatically set to the zaak so the zaak is closed.
However, if the zaak doesn't have a Resultaat when EindDatum field is set, then a Resultaat with the dummy value under 'endCaseEndDate' in Profile.json file (translation profile) is set to zaak. After that, EindStatus is automatically set to the zaak so the zaak is closed. 'endCaseEndDate' property should be at the same level of the 'zaakTypeIdentificatie' property which is the Zaaktype of the zaak in the profile so that it could be fetched by using the 'zaakTypeIdentificatie' from Profile.json file.

2) Setting EindStatus(LastStatus)
There is no specifically EindStatus field in updateZaak (or any other) message. However, the fields under 'Heeft' element in updateZaak message are used to create an EindStatus. When an updateZaak message is sent and if the 'Heeft' element has the required fields and if the zaak has a Resultaat, then EindStatus is created and set to the Zaak so the zaak is closed. 
In case the zaak doesn't have a Resultaat, the dummy value under 'endDateAndResultLastStatus' in Profile.json file is used to create one. 'endDateAndResultLastStatus' property should be at the same level of the 'zaakTypeIdentificatie' property which is the Zaaktype of the zaak in the profile so that it could be fetched by using the 'zaakTypeIdentificatie' from Profile.json file.

3) Setting both EindDatum (End Date) and EindStatus(Last Status)
In case of having both EindDatum and EindStatus(meaning having required fields under 'Heeft' element) in updateZaak message, first EindStatus path is used to close a zaak. If Zaak doesn't have a Resultaat and if there is no dummy value under 'endDateAndResultLastStatus' in Profile.json then EindDatum path is used to close the zaak.

### Closing zaak with actualiseerZaakStatus message (Configurable)
A zaak can also be closed with actualiseerZaakStatus message with eindStatus in it unless the `ignoreEindStatusInActualiseerZaakStatus` property is set true in profiles.json file (translation profile).

As default the property is falsy so a zaak can be close by actualiseerZaakStatus. If ignoring the eindStatus in actualiseerZaakStatus message is wanted, then add the property `ignoreEindStatusInActualiseerZaakStatus` with value "true" into the `profileDefaults` section in profiles.json file. Then zaak closure with actualiseerZaakStatus message will not be allowed for any zaaktype.

It is also possible to add `ignoreEindStatusInActualiseerZaakStatus` property to a specific zaaktype as well if different behaviour is desired.

If a zaaktype is not listed in profiles or the profile of a specific zaaktype doesn't have the `ignoreEindStatusInActualiseerZaakStatus` property, then always the one in `profileDefaults` section is used. If `ignoreEindStatusInActualiseerZaakStatus` is not set at all in any section of profile.json file, then it will be counted as false so zaak closure with actualiseerZaakStatus message will be allowed.

Example configuration:
```json
{
    "profileDefaults": {
        "ignoreEindStatusInActualiseerZaakStatus": "true"
    },
    "profile": [
        {
            "zaakTypeIdentificatie": "B9999",
            "endCaseEndDate": {
                "coalesceResultaat": "Onbekend"
            },
            "endDateAndResultLastStatus": {
                "coalesceResultaat": "Onbekend"
            }
        },
        {
            "zaakTypeIdentificatie": "B1210",
            "ignoreEindStatusInActualiseerZaakStatus": "false",
            "endDateAndResultLastStatus": {
                "coalesceResultaat":"Vergunningvrij" 
            }
        },
        {
            "zaakTypeIdentificatie": "B1026",
            "endCaseEndDate": {
                "coalesceResultaat": "Toegekend"
            }
        }
    ]
}
```

Will result in:
```json
{
    "profile": [
        {
            "zaakTypeIdentificatie": "B9999",
            "ignoreEindStatusInActualiseerZaakStatus": "true",
            "endCaseEndDate": {
                "coalesceResultaat": "Onbekend"
            },
            "endDateAndResultLastStatus": {
                "coalesceResultaat": "Onbekend"
            }
        },
        {
            "zaakTypeIdentificatie": "B1210",
            "ignoreEindStatusInActualiseerZaakStatus": "false",
            "endDateAndResultLastStatus": {
                "coalesceResultaat":"Vergunningvrij" 
            }
        },
        {
            "zaakTypeIdentificatie": "B1026",
            "ignoreEindStatusInActualiseerZaakStatus": "true",
            "endCaseEndDate": {
                "coalesceResultaat": "Toegekend"
            }
        }
    ]
}
```

### Routing:<br/>
Zaakbrug supports multiple ways of routing messages:
1. Default behavior: Zaakbrug behaves normally and communicates with Openzaak
2. Orchestration: Zaakbrug communicates with Openzaak as normal, but also sends certain messages to a secondary system, like Suite Sociaal Domein. Messages are first processed like normal and sent to Openzaak, and when that results in success, the message is also sent to the secondary system. In case of error, the message will not be orchestrated, and the error will be returned. In all cases, the response from Openzaak is returned and the response from the secondary system is ignored.
3. Migration: Similar to Orchestration, with the difference that messages are still sent to the secondary system regardless of the result of the normal processing and sending to Openzaak. This is useful if you want 2 systems to run parallel during a migration project to see the differences between them.

Configuring which messages are processed in which way is done in RoutingProfiles and RoutingProfileDefaults.

- `RoutingProfileDefaults` describes the default way of routing messages per SOAPAction.
- `RoutingProfiles` gives the option to configure the behavior for each SOAPAction per zaaktype

Configuration fields:

- route: this describes the route for this message type. `translate` is the normal way of processing and sending the message to Openzaak. `replicate` is used for orchestration and migration cases. `proxy` can be used if you want the message to be sent to the secondary system only.<br/>
Options: `[translate|replicate|proxy].[beantwoord-vraag|ontvang-asynchroon|vrije-berichten]`
- stopOnError: this is applicable only if the first part of `route` is `replicate`. This describes whether the message should be sent to the secondary system in case of error during normal processing and sending message to Openzaak.<br/>
Options: `[true|false]`

This can all be configured in values.yaml under the zaakbrug service, and can look something like this:

```yaml
routing:
   profiles:
      - zaakTypeIdentificatie: "B9999"
        geefZaakdocumentLezen_Lv01:
        route: "replicate.beantwoord-vraag"
        stopOnError: true
      - zaakTypeIdentificatie: "B1026"
        creeerZaak_Lk01:
        route: "proxy.ontvang-asynchroon"
        stopOnError: true
   profileDefaults:
     geefZaakdocumentLezen_Lv01:
        route: translate.beantwoord-vraag
        stopOnError: true
     geefZaakstatus_Lv01:
        route: translate.beantwoord-vraag
        stopOnError: true
     geefZaakdetails_Lv01:
        route: translate.beantwoord-vraag
        stopOnError: true
     geefLijstZaakdocumenten_Lv01:
        route: translate.beantwoord-vraag
        stopOnError: true
     voegZaakdocumentToe_Lk01:
        route: translate.ontvang-asynchroon
        stopOnError: true
     maakZaakdocument_Lk01:
        route: translate.ontvang-asynchroon
        stopOnError: true
     actualiseerZaakstatus_Lk01:
        route: translate.ontvang-asynchroon
        stopOnError: true
     creeerZaak_Lk01:
        route: replicate.ontvang-asynchroon
        stopOnError: true
     updateZaak_Lk01:
        route: translate.ontvang-asynchroon
        stopOnError: true
     genereerDocumentIdentificatie_Di02:
        route: translate.vrije-berichten
        stopOnError: true
     genereerZaakIdentificatie_Di02:
        route: translate.vrije-berichten
        stopOnError: true
     geefZaakdocumentbewerken_Di02:
        route: translate.vrije-berichten
        stopOnError: true
     updateZaakdocument_Di02:
        route: translate.vrije-berichten
        stopOnError: true
     cancelCheckout_Di02:
        route: translate.vrije-berichten
        stopOnError: true
```
        
In this case, 'creeerZaak' messages will be sent to `replicate` by default. In case of `zaakTypeIdentificatie`:`B9999`, `geefZaakdocumentLezen` messages will be sent to `replicate`, and in case of `zaakTypeIdentificatie`:`B1026`, `creeerZaak` messages will be sent to `proxy`. In all cases where messages are sent to `replicate`, `stopOnError` is `true`, so this is an orchestration scenario.

## ZaakBrug Development
Refer to `CONTRIBUTING.md`.
