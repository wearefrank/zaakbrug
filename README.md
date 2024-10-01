![zaakbrug-banner-small.png](/docs/picturesReadme/zaakbrug-banner-small.png)

Successor of [Open-ZaakBrug](https://sudwest-fryslan.github.io/OpenZaakBrug), an app for Dutch municipalities that supports the transition from "zaak- en documentatieservices" (zds) to "zaakgericht werken" (zgw).

Dutch municipalities provide services that are delivered many times. An example of such a service is to provide passports. This service is delivered many times because each citizen needs a passport or an ID card. An instance of a service that is provided multiple times is referred by the Dutch word "zaak" (case).

There is a new specification named "zaakgericht werken" (zgw) for case register systems. Zgw is part of the [Common Ground specification](https://vng.nl/artikelen/common-ground) for software used by Dutch municipalities. Zgw will replace an old specification called "zaak- en documentatieservices" (zds). The municipality of Súdwest Fryslân wants to migrate to the zgw standard without having to invest in zds interfaces. To this end, the municipality has built the system Open-ZaakBrug (brug means bridge). It acts as an interface between a zgw case register system on the one hand and zds systems connecting to the case register system on the other hand. The Open-ZaakBrug source code is hosted on [GitHub Sudwest-Fryslan/OpenZaakBrug](https://github.com/Sudwest-Fryslan/OpenZaakBrug). For a comparison of zgw and zds see [API-standaarden voor Zaakgericht Werken vergeleken met de Zaak- en Documentservices](https://vng.nl/sites/default/files/2022-03/20200703%20-%20Vergelijking%20ZGW%20APIs%20en%20ZDS_v1.0.pdf#:~:text=De%20Zaak-%20en%20Documentservices%20%28ZDS%29-standaard%20beschrijft%20hoe%20een,vakapplicatie%20en%20deze%20worden%20gekopieerd%20naar%20het%20zaaksysteem).

This project, ZaakBrug, is meant to be a successor of Open-ZaakBrug. It leverages the [Frank!Framework](https://wearefrank.nl/en/framework) and its debugger Ladybug. The debugger shows for each incoming request which steps are executed to process the message. If there are errors, this information can be used for easy debugging. ZaakBrug does not only connect zds systems with case register system [OpenZaak](https://openzaak.org/en), but with any case register system that implements zgw.

# Starting ZaakBrug

### Development in Visual Studio Code

When you are doing development work on ZaakBrug, you may want to boot it using WeAreFrank!'s Frank!Runner. When you use the Frank!Runner, you can boot ZaakBrug from within your Integrated Development Environment (IDE); we support the two IDEs Visual Studio Code and Eclipse.

To boot ZaakBrug using the Frank!Runner, you need version control system Git. Choose or create some empty directory in which you can clone Git repositories. For the sake of the argument, we assume it to be `work`. Please do the following:

1. Open a command prompt and change directory to `work`.
1. Clone the Frank!Runner: `git clone https://github.com/wearefrank/frank-runner`.
1. Clone ZaakBrug: `git clone https://github.com/wearefrank/zaakbrug`.
1. Start the Frank!Runner with one of the boot scripts in the Frank!Runner checkout directory: `start.bat` or `restart.bat` for Windows or `start.sh` or `restart.sh` for Linux or Mac. This step lets the Frank!Runner download Ant, a build tool for Java applications.
1. Configure your IDE as described in the Frank!Runner's documentation, see https://github.com/wearefrank/frank-runner. For VS Code, these instructions let you install the Task Explorer plugin by Scott Meesseman.
1. If your IDE is Visual Studio Code, you should have a link to open ZaakBrug, see number 2 in the figure below. Use the menu option number 1 to get access to the link. Click the link to open ZaakBrug using the Frank!Runner.

   ![antJobVsCode.jpg](/docs/picturesReadme/antJobVsCode.jpg)

### Running with Docker

In a production environment it is recommended to run ZaakBrug with Docker. Ensure that Docker is installed on your computer and proceed as follows:

1. Clone GitHub project https://github.com/wearefrank/zaakbrug if you have not done so yet.
1. Open a command prompt and change directory to the checkout directory.
1. Build your Docker image from the source code using a command like the following: `docker build -t zaakbrug:test .`.
1. Run ZaakBrug using a command like the following: `docker run -p 8080:8080 -e dtap.stage=LOC --name=zaakbrug zaakbrug:test`.
1. To see the user interface of ZaakBrug, open a webbrowser and visit http://localhost:8080.
1. ZaakBrug provides an automated health check. You can run it with the following command: `docker inspect --format='{{json .State.Health.Status}}' zaakbrug`.

   > **Warning:** In a DOS command window under Windows, the string after `--format=` has to be enclosed between `""`. You have `docker inspect --format="{{json .State.Health.Status}}" zaakbrug`.
   
   > **Info:** If you know the Frank!Framework, the following information may be helpful. If the health check produces the value `healthy`, it is guarenteed that all adapters in the Frank configuration have booted without errors.

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

## Local Development Docusaurus
1. Navigate to "docusaurus" subfolder with `cd ./docusaurus`.
2. Install dependencies with `npm install`.
3. Serve Docusaurus webserver locally with `docusaurus start`. By default it is served at `http://localhost:3000/`.
4. Basic guide on how to use Docusaurus and a styleguide can be found at `./docusaurus/docs/_README.md`.
