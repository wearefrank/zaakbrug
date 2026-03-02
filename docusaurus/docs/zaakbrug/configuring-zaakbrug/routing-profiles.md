---
sidebar_position: 100
---

# Routing Profiles

Zaakbrug supports multiple ways of routing messages:
1. Default behavior: Zaakbrug behaves normally and communicates with Openzaak
2. Orchestration: Zaakbrug communicates with Openzaak as normal, but also sends certain messages to a secondary system, like Suite Sociaal Domein. Messages are first processed like normal and sent to Openzaak, and when that results in success, the message is also sent to the secondary system. In case of error, the message will not be orchestrated, and the error will be returned. In all cases, the response from Openzaak is returned and the response from the secondary system is ignored.
3. Migration: Similar to Orchestration, with the difference that messages are still sent to the secondary system regardless of the result of the normal processing and sending to Openzaak. This is useful if you want 2 systems to run parallel during a migration project to see the differences between them.

Configuring which messages are processed in which way is done in RoutingProfiles and RoutingProfileDefaults.

- `RoutingProfileDefaults` describes the default way of routing messages per SOAPAction.
- `RoutingProfiles` gives the option to configure the behavior for each SOAPAction per zaaktype

Configuration fields:

- route: this describes the route for this message type. `translate` is the normal way of translating and sending the message to Openzaak. `replicate` is used for orchestration and migration cases. `proxy` can be used if you want the message to be sent to the secondary system only.<br/>
  Options: `[translate|replicate|proxy].[beantwoord-vraag|ontvang-asynchroon|vrije-berichten]`
- stopOnError: this is applicable only if the first part of `route` is `replicate`. This describes whether the message should be sent to the secondary system in case of error during normal translating and sending message to Openzaak.<br/>
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
