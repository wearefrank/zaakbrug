---
sidebar_position: 100
---

# Set Defaults For All Profiles

Profile defaults can be used to configure common translation profile settings. The settings configured in the `profileDefaults` section are applied to **all** zaaktypen. When a regular translation profile for a specific zaaktype is also configured, the settings are merged together. The more specific per zaaktype translation profile will always override any overlapping settings from the `profileDefaults` section. Items in array's like `valuesOverrides` will be combined instead, unless there is an overlapping key. Here the more specific per zaaktype translation profile will also always override any overlapping keys from the ones in the `profileDefaults` section.

For example, the following configuration:
```json
{
    "profileDefaults": {
        "endCaseEndDate": {
            "coalesceResultaat": "Onbekend"
        },
        "valueOverrides": [
            {
                "key": "zgw.zaken-api.zaken.zaak.toelichting",
                "value": "toelichting from profileDefaults"
            }
        ]
    },
    "profile": [
        {
            "zaakTypeIdentificatie": "B9999",
            "endDateAndResultLastStatus": {
                "coalesceResultaat": "Onbekend"
            },
            "valueOverrides": [
                {
                    "key": "zgw.zaken-api.zaken.zaak.communicatiekanaal",
                    "value": "http://example.com"
                }
            ]
        },
        {
            "zaakTypeIdentificatie": "B1026",
            "endCaseEndDate": {
                "coalesceResultaat": "Toegekend"
            },
            "valueOverrides": [
                {
                    "key": "zgw.zaken-api.zaken.zaak.toelichting",
                    "value": "toelichting from specific translation profile"
                }
            ]
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
            // highlight-start
            "endCaseEndDate": {
                "coalesceResultaat": "Onbekend",
            },
            // highlight-end
            "endDateAndResultLastStatus": {
                "coalesceResultaat": "Onbekend"
            },
            "valueOverrides": [
                // highlight-start
                {
                    "key": "zgw.zaken-api.zaken.zaak.toelichting",
                    "value": "toelichting from profileDefaults"
                },
                // highlight-end
                {
                    "key": "zgw.zaken-api.zaken.zaak.communicatiekanaal",
                    "value": "http://example.com"
                }
            ]
        },
        {
            "zaakTypeIdentificatie": "B1026",
            "endCaseEndDate": {
                // highlight-next-line
                "coalesceResultaat": "Toegekend"
            },
            "valueOverrides": [
                {
                    "key": "zgw.zaken-api.zaken.zaak.toelichting",
                    // highlight-next-line
                    "value": "toelichting from specific translation profile"
                }
            ]
        }
    ]
}
```