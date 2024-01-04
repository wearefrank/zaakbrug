# Contributing

# Bumping dependencies
## Frank!Framework version
We like to stay up-to-date with the latest version of the Frank!Framework to get the latest features, improvements, bug fixes and security patches. For stability reasons we do not want to use the "latest" tag for this. Instead we periodically(~weekly) do a manual bump to the latest available snapshot build of Frank!Framework at that time. Mainly because we use custom code that needs to be manual checked and updated with changes made in the Frank!Framework. 

Execute the following steps when bumping the Frank!Framework version:
1. Look up the latest framework snapshot build on [DockerHub - Frank!Framework](https://hub.docker.com/r/frankframework/frankframework/tags). The format of the tag should be: `<major>.<minor>-<date>.<build>`. For example: 7.9-20230907.223421.
2. Replace the value of `FF_VERSION` in the `Dockerfile` with the new tag.
3. Replace the value of `FF_VERSION` in the `Dockerfile.java8` with the new tag.
4. Replace the default value for `FF_VERSION` under `services.zaakbrug.build.args` in `docker-compose.zaakbrug.dev.yml` with the new tag. NOTE: Watch out to not replace the '-' in front of the tag: ${FF_VERSION:-<new tag>}
5. Replace the value of `ff.version` in `frank-runner.properties` with the new tag.
6. Start ZaakBrug with the `Frank!Runner` to automatically replace the `./src/main/configuration/<configuration-name>/FrankConfig.xsd` and `./src/main/configuration/FrankConfig.xsd` with the newer version. You can stop the Frank!Runner once the files are replaced. Note that currently the Frank!Runner will also add `FrankConfig.xsd` to the `.gitignore` file. Make sure to revert the change to `.gitignore`.
7. Check [GitHub - Frank!Framework - Parameter.java commit history](https://github.com/ibissource/iaf/commits/master/core/src/main/java/nl/nn/adapterframework/parameters/Parameter.java) for any changes to this class. If there are indeed changes, update the corresponding file under `./src/main/java/nl/nn/adapterframework/...`. The `.java-orig` file content should be 1 on 1 equal to the new version on GitHub. Take care to not accidentally remove the intended customization of the code in the `.java` file.
8. Run the e2e testsuite by using the below Docker-Compose and configuration to validate the changes. You should only need `docker-compose -f ./docker-compose.zaakbrug.dev.yml -f ./docker-compose.openzaak.dev.yml up --build --force-recreate` for this. (TODO: Automate running of e2e tests in ci/cd).
9. Commit you changes on a branch with as message: `build(dependencies): bump f!f version to <new tag>`. Create a PR to have you changes merged to master.

# Testing with SoapUI



## Configuring SoapUI
Out-of-the-box SoapUI saves the dynamic properties set during execution of the tests to the project file. Having these dynamic properties value changes in the project file, makes it harder for Git to merge without a merge conflict. Git does not know the context of the changes and will simply see local and incoming changes to the same part of the project file, leading to a merge conflict that is hard to manually solve due to the sheer size of the projec t file. To combat this, we added a save script to the project that automatically clears all dynamic property values when saving the project, so that only functional changes end up in the project file. 

Unfortunatly Load and Save scripts are disabled by default in SoapUI. You can enable them by unchecking **Disable the Load and Save scripts** under `File -> Preferences -> Global Security Settings`.

Additionally, to help out diff tools, also enable the option **Pretty Print Project Files** and disable the option **Cache WSDLs** under `File -> Preferences -> WSDL Settings`.

## Coding standards
- Put dynamic properties(temporary values during test execution) in the **"Properties" TestStep**. Their values get cleared when saving the project.
- Put static properties in the **Custom Properties** section of TestCase, TestSuite or Project.
- When you open the SoapUI project in a new version of SoapUI, Save the project and create a seperate PR for any changes in the project file.
- Try to keep to one change at a time and keep them small.
- Whenever possible, avoid combining changes that both add and remove lots of things.


## Manual testing with own test cases
If you would like to create and run your own test cases in SoapUI then you should complete the configuration under "docker-compose.openzaak.dev" section below to be able to have the catalog imported. Afterwards, you could create your own test cases in SoapUI.

## Manual testing with already prepared test cases in the repo
If you would like to run the test cases already prepared in the repo, then you don't need to import catalog at all. However, you first need to import the test cases in SoapUI. To do so:
- Click on the 'Import' button on SoapUI.
- Go to the directory that has the ZaakBrug project downloaded.
- Go to the folder ./e2e/SoapUI and select the zaakbrug-e2e-soapui-project.xml file

When you have imported the tests you can run any test case under the TestSuite, the test case will manage creating own catalog with required data and delete everything created after the test run is completed. These processes will be done by "SetUp" and "TearDown" test cases which are disabled as default and no need to enable them because they are called inside the main test case.


# Docker-compose
The docker-compose development environment is designed to be flexible and composable. This prevents the need for developers to run the entire stack eventhough their work requires only a small part of the stack. For this we make use of a docker-compose feature that merges a given array of docker-compose files together. Simply provide a `-f ./docker-compose.<application>.yml` argument for each docker-compose file you wish to include in the `docker-compose up`command.

To run the entire stack the command would be `docker-compose -f ./docker-compose.zaakbrug.dev.yml -f ./docker-compose.zaakbrug.staging.dev.yml -f ./docker-compose.openzaak.dev.yml -f ./docker-compose.openforms.dev.yml up --build`

> WARNING: It is important to use `host.docker.internal` instead of the usual `localhost`. The url-validator that is used by most components with invalidate any urls that contain only a hostname. It requires a full canonical domain name.

#### Webgui's
The webgui's of the different components are only accesible through a dedicated Nginx reverse-proxy at `host.docker.internal:9000`.
| Url | Component |
| --- | --- |
| host.docker.internal:9000/zaakbrug/ | Zaakbrug. |
| host.docker.internal:9000/zaakbrug/staging/ | Internal tailored "staging"/"cache" OpenZaak instance. |
| host.docker.internal:9000/openzaak/ | OpenZaak. |
| host.docker.internal:9000/openforms/ | Open Formulieren. |

#### Api's
Most components also have their own Nginx proxy that is exposed to the Docker host. This is mostly to make use of X-Sendfile functionality and to more closely simulate production infrastructure. X-Sendfile allows applications to redirect and delegate the request for a file to the webserver. It is generally a much more performant way to transfer files. 

| Url | Component |
| --- | --- |
| host.docker.internal:8080/ | ZaakBrug. |
| host.docker.internal:9001/ | OpenZaak. |
| host.docker.internal:9003/ | Open Formulieren. |

## docker-compose.zaakbrug.dev
Contains an instance of ZaakBrug built locally from source and a Nginx reverse proxy is used to provide access to the different components in the stack. By default Nginx is exposed on port `9000`.

ZaakBrug Console can accessed from `host.docker.internal:9000/zaakbrug/`  
ZaakBrug is also exposed on `host.docker.internal:8080/`

#### Configuration
By default ZaakBrug uses a filebased H2 database for storing the last used zaak and documenten identifiers. To facilitate easy swapping between development with docker-compose and the Frank!Runner, the default mount for the database file is `../frank-runner/data`. Using the same database file between the Frank!Runner and docker-compose prevents errors surrounding duplicate identifiers while running tests against OpenZaak. If you don't have the Frank!Runner installed, you can use `./data` that is commented out instead or add a volume for it.

### Postgres
Instead of the default filebased H2 database, a Postgresql database can be used too. Adding `-f ./docker-compose.zaakbrug.postgres.yml` to your `docker-compose up` command is all that is needed for this.

For example: `docker-compose -f ./docker-compose.zaakbrug.dev.yml -f ./docker-compose.zaakbrug.postgres.yml up --build`

> Note: Database data is not seamlessly shared with the Frank!Runner out-off-the-box. In `src/webapp/META_INF/context.xml` you can comment out the H2 configuration and uncomment the Postgress one. The Frank!Runner will then use the Postgres database used in the docker-compose.

#### PgAdmin4
To aid with debugging you can use PgAdmin4 to browse/edit the Postgres database. PgAdmin4 is included and pre-configured in `docker-compose.zaakbrug.postgres` and can be enabled by adding `--profile pgadmin` to your `docker-compose up` command.

The PgAdmin4 web-GUI is exposed on port `5050`, so can be accessed with `localhost:5050` or `host.docker.internal:5050`

**default login:**  
email: `admin@wearefrank.nl`  
password: `admin` 

For example: `docker-compose -f ./docker-compose.zaakbrug.dev.yml -f ./docker-compose.zaakbrug.postgres.yml --profile pgadmin up --build`

## docker-compose.zaakbrug.staging.dev
Contains an instance of OpenZaak specifically configured to act as cache or staging for ZGW to ZDS translations. It shares a network with ZaakBrug, and should be considered a component of the ZaakBrug deployment for when ZGW to ZDS translations are required.

The ZaakBrug "staging" OpenZaak admin console can be accessed from `host.docker.internal:9000/zaakbrug/staging/`  
The ZaakBrug "staging" OpenZaak is not exposed.

**default web-GUI login:**  
username: `admin`  
password: `admin`

#### Configuration
When running OpenZaak for the first time or after the database data has been lost, it is necessary to configure an application in the OpenZaak admin gui with the correct JWT client_id and secret at `API Authorisaties -> Applicaties -> Applicatie toevoegen +`. For development, the default credentials can be found in `./src/main/resources/credentials.properties`. Makes sure to also click the `Heeft alle autorisaties` checkbox. The Label can be anything.

Next, a catalog needs to be imported and published. Go to `Gegevens -> Catalogi -> Importeer catalogus +`. Browse to `./e2e/OpenZaak/openzaak-export-catalogus-zaaktypes-updated.zip` in the ZaakBrug repository. Make sure `Generate new UUIDs` is checked and click `Importeer`. To publish the catalog, you need to publish the individual resources contained in the catalog. You can find `Toon Zaaktypen | Toon besluittypen | Toon Informatieobjecttypen` in the `Acties` column. Start by following the right-most link, select all items in the table, select the option `Publiceer de geselecteerde...` from the dropdown just above the table and click `uitvoeren`. Repeat this for the other two links.

## docker-compose.openzaak.dev
Contains an instance of OpenZaak for testing ZDS to ZGW translations.

OpenZaak Admin console can be accessed from `host.docker.internal:9000/openzaak/`  
OpenZaak is also exposed on `host.docker.internal:9001/`

**default web-GUI login:**  
username: `admin`  
password: `admin`

#### Configuration
When starting OpenZaak, an application is configured in OpenZaak automatically with the default credentials which can be found in `./src/main/resources/credentials.properties` so there is no need to configure any other one manually. The configured application can be monitored at `API Authorisaties -> Applicaties`.

*Note: If you want to run the already prepared SoapUI test cases in the repo, then you can skip the following action (importing catalog) and you can go to "Manual testing with already prepared test cases in the repo" under "Testing with SoapUI" section. If you want to run your own created test cases, then follow the following step.*

Next, a catalog needs to be imported and published. Go to `Gegevens -> Catalogi -> Importeer catalogus +`. Browse to `./e2e/OpenZaak/openzaak-export-catalogus-zaaktypes-updated.zip` in the ZaakBrug repository. Make sure `Generate new UUIDs` is checked and click `Importeer`. To publish the catalog, you need to publish the individual resources contained in the catalog. You can find `Toon Zaaktypen | Toon besluittypen | Toon Informatieobjecttypen` in the `Acties` column. Start by following the right-most link, select all items in the table, select the option `Publiceer de geselecteerde...` from the dropdown just above the table and click `uitvoeren`. Repeat this for the other two links.

## docker-compose.openforms.dev
TODO

Open Formulieren can be accessed from `host.docker.internal:9000/openforms/`  
Open Formulieren is also exposed on `host.docker.internal:9003/`

TODO

## docker-compose.sentry.dev
Contains a Sentry instance for monitoring applications in the environment. Particularly useful for troubleshooting OpenZaak, OpenForms, etc.

The Sentry GUI can be accessed at `host.docker.internal:9500` or `localhost:9500`.

#### Configuration
Running Sentry for the first time requires some configuration.

TODO: Automate configuration

1. Makes sure the `docker-compose.sentry.dev.yml` is included in your ` docker-compose up` and is running.
2. Open a CMD or Powershell in this repository folder and run `docker-compose -f ./docker-compose.sentry.dev.yml exec sentry sentry upgrade`.
3. After approx. a minute you will get asked if you want to create a user account. Choose `y` and hit enter.
4. We use the following defaults: email=`admin@wearefrank.nl`, password: `admin`.
5. Once finished, run the command: `docker-compose -f ./docker-compose.sentry.dev.yml restart sentry` to restart the sentry container.
6. Open a browser and navigate to `host.docker.internal:9500` or `localhost:9500`. You should see the Sentry login page. Login we the email and password from step 4.
7. Make sure the root url is `http://host.docker.internal:9500` and choose `Please keep my usage information anonymous` under Usage Statistics.
8. In the top-right corner hit the `add...` button and choose `project`.
9. Select the appropriate platform. For OpenZaak, ZaakBrug-Staging and OpenForms this will be `Django`. Change the project name appropriately and hit the `Create Project` button.
10. On the next page look for the word `dsn` and copy the value.
11. In the appropriate docker-compose file, add the following to the environment variables of the `open-zaak`, `zaakbrug-staging` and/or `open-forms` service:
```
- SENTRY_DSN=<Your copied DSN from step 10>
- SDK_SENTRY_DSN=<Your copied DSN from step 10>
```
12. Repeat step 8 - 11 for each application you want to monitor.
