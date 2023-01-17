Successor of Open-ZaakBrug, an app for Dutch municipalities that supports the transition from "zaak- en documentatieservices" (zds) to "zaakgericht werken" (zgw).

Dutch municipalities provide services that are delivered many times. An example of such a service is to provide passports. This service is delivered many times because each citizen needs a passport or an ID card. An instance of a service that is provided multiple times is referred by the Dutch word "zaak" (case).

There is a new specification named "zaakgericht werken" (zgw) for case register systems. Zgw is part of the Common Ground specification for software used by Dutch municipalities (https://vng.nl/artikelen/common-ground). Zgw will replace an old specification called "zaak- en documentatieservices" (zds). The municipality of Súdwest Fryslân wants to migrate to the zgw standard without having to invest in zds interfaces. To this end, the municipality has built the system Open-ZaakBrug (brug means bridge). It acts as an interface between a zgw case register system on the one hand and zds systems connecting to the case register system on the other hand. Open-ZaakBrug is hosted at https://github.com/Sudwest-Fryslan/OpenZaakBrug. For a comparison of zgw and zds see https://vng.nl/sites/default/files/2022-03/20200703%20-%20Vergelijking%20ZGW%20APIs%20en%20ZDS_v1.0.pdf#:~:text=De%20Zaak-%20en%20Documentservices%20%28ZDS%29-standaard%20beschrijft%20hoe%20een,vakapplicatie%20en%20deze%20worden%20gekopieerd%20naar%20het%20zaaksysteem.

This project, ZaakBrug 2.0, is meant to be a successor of Open-ZaakBrug. It leverages the [Frank!Framework](https://wearefrank.nl/en/framework) and its debugger Ladybug. The debugger shows for each incoming request which steps are executed to process the message. If there are errors, this information can be used for easy debugging. ZaakBrug 2.0 does not only connect zds systems with case register system [OpenZaak](https://openzaak.org/en), but with any case register system that implements zgw.

# Starting ZaakBrug 2.0

### Development in Visual Studio Code

When you are doing development work on ZaakBrug 2.0, you may want to boot it using WeAreFrank!'s Frank!Runner. When you use the Frank!Runner, you can boot ZaakBrug 2.0 from within your Integrated Development Environment (IDE); we support the two IDEs Visual Studio Code and Eclipse.

To boot ZaakBrug 2.0 using the Frank!Runner, you need version control system Git. Choose or create some empty directory in which you can clone Git repositories. For the sake of the argument, we assume it to be `work`. Please do the following:

1. Open a command prompt and change directory to `work`.
1. Clone the Frank!Runner: `git clone https://github.com/ibissource/frank-runner`.
1. Clone ZaakBrug 2.0: `git clone https://github.com/ibissource/open-zaakbrug`.
1. Start the Frank!Runner with one of the boot scripts in the Frank!Runner checkout directory: `start.bat` or `restart.bat` for Windows or `start.sh` or `restart.sh` for Linux or Mac. This step lets the Frank!Runner download Ant, a build tool for Java applications.
1. Configure your IDE as described in the Frank!Runner's documentation, see https://github.com/ibissource/frank-runner.
1. If your IDE is Visual Studio Code, you should have a link to open ZaakBrug 2.0, see number 2 in the figure below. Use the menu option number 1 to get access to the link. Click the link to open ZaakBrug 2.0 using the Frank!Runner.

   ![antJobVsCode.jpg](/docs/picturesReadme/antJobVsCode.jpg)

### Running with Docker

In a production environment it is recommended to run ZaakBrug 2.0 with Docker. Ensure that Docker is installed on your computer and proceed as follows:

1. Clone GitHub project https://github.com/ibissource/open-zaakbrug if you have not done so yet.
1. Open a command prompt and change directory to the checkout directory.
1. Build your Docker image from the source code using a command like the following: `docker build --no-cache -t open-zaakbrug:test .`.
1. Run ZaakBrug using a command like the following: `docker run --rm -p 8080:8080 -e dtap.stage=LOC --name=open-zaakbrug open-zaakbrug:test`.
1. To see the user interface of ZaakBrug 2.0, open a webbrowser and visit http://localhost:8080.
1. ZaakBrug 2.0 provides an automated health check. You can run it with the following command: `docker inspect --format='{{json .State.Health.Status}}' open-zaakbrug`.

   > **Info:** If you know the Frank!Framework, the following information may be helpful. If the health check produces the value `healthy`, it is guarenteed that all adapters in the Frank configuration have booted without errors.