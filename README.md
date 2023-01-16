Opvolger van Open-Zaakbrug, een applicatie die de transitie van zaak- en documentatieservices (zds) naar zaakgericht werken (zgw) ondersteunt voor Nederlandse gemeenten.

De nieuwe standaard voor het zaakgewijs werken is de zgw standaard, dit is de opvolger van de zaak- en documentservices (zds) standaard. Om de overstap te maken naar deze nieuwe standaard vindt de gemeente Súdwest Fryslân het belangrijk om niet meer te investeren in de oude zds koppelingen, maar zo snel mogelijk de nieuwe zgw-standaard te gebruiken. Om deze reden heeft het team Open Zaakbrug van deze gemeente een oplossing gemaakt om de bestaande applicaties, die de oude zds-standaard praten, toch met een zgw-zaaksysteem te laten praten. Zie https://github.com/Sudwest-Fryslan/OpenZaakBrug#open-zaakbrug-zds-to-zgw. Zie ook https://vng.nl/sites/default/files/2022-03/20200703%20-%20Vergelijking%20ZGW%20APIs%20en%20ZDS_v1.0.pdf#:~:text=De%20Zaak-%20en%20Documentservices%20%28ZDS%29-standaard%20beschrijft%20hoe%20een,vakapplicatie%20en%20deze%20worden%20gekopieerd%20naar%20het%20zaaksysteem voor een vergelijking van de zgw en de zds standaarden.

Dit project, ZaakBrug 2.0, is bedoeld als opvolger van Open-Zaakbrug. Het werkt op basis van het Frank!Framework (zie https://wearefrank.nl/framework/) en de debugger Ladybug die daar bij hoort. Deze debugger laat zien welke stappen zijn gevolgd bij het verwerken van een bericht zodat eventuele problemen gemakkelijk onderzocht kunnen worden. ZaakBrug 2.0 verbindt zds systemen niet alleen met zgw systeem OpenZaak (https://openzaak.org/), maar ook met andere zgw implementaties. Dit is de reden van de naamswijziging van Open-Zaakbrug naar ZaakBrug.

# Opstarten

### Ontwikkelen in Visual Studio Code

Voor het ontwikkelen aan ZaakBrug 2.0 is het handig om dit systeem op te starten met de Frank!Runner van WeAreFrank!. Je kan ZaakBrug dan starten vanuit je Integrated Development Environment, Visual Studio Code of Eclipse.

Om ZaakBrug 2.0 te kunnen opstarten met de Frank!Runner heb je versiebeheersysteem Git nodig. Kies een werk directory waarin je Git repositories kan uitchecken, zeg `work`. Doe het volgende:

1. Open een command prompt en ga naar directory `work`.
1. Clone de Frank!Runner: `git clone https://github.com/ibissource/frank-runner`.
1. Clone ZaakBrug: `git clone https://github.com/ibissource/open-zaakbrug`.
1. Start de Frank!Runner met het een van de start scripts in de checkout directory: `start.bat` of `restart.bat` onder Windows of `start.sh` of `restart.sh` onder Linux of op een Apple computer. Met deze stap zorg je ervoor dat ANT wordt gedownloaded.
1. Configureer je IDE zoals beschreven in de documentatie van de Frank!Runner, zie https://github.com/ibissource/frank-runner.
1. Als je met VS Code werkt, dan heb je een link om ZaakBrug te starten, zie nummer 2 in onderstaande figuur. Gebruik de menu optie nummer 1 om toegang te krijgen tot deze link. Klik de link om ZaakBrug te starten met de Frank!Runner.

   ![antJobVsCode.jpg](/docs/picturesReadme/antJobVsCode.jpg)

### Opstarten met Docker

In een productie omgeving is het handig om ZaakBrug te starten met Docker. Zorg dat Docker geïnstalleerd is. Doe daarna het volgende:

1. Clone GitHub project https://github.com/ibissource/open-zaakbrug als je dat nog niet gedaan hebt.
1. Open een command prompt en ga naar de checkout directory.
1. Bouw uit de broncode een docker image met het volgende commando: `docker build --no-cache -t open-zaakbrug:test .`.
1. Run ZaakBrug, bijvoorbeeld met het volgende commando: `docker run --rm -p 8080:8080 -e dtap.stage=LOC --name=open-zaakbrug open-zaakbrug:test`.
1. Je kan ZaakBrug zien door een webbrowser te openen en te gaan naar: http://localhost:8080.
1. ZaakBrug ondersteunt ook een geautomatiseerde health check. Die kan je doen met het volgende commando: `docker inspect --format='{{json .State.Health.Status}}' open-zaakbrug`.

   > **Info:** Als je het Frank!Framework kent, dan helpt de volgende informatie misschien. Als de health check status `healthy` oplevert, dan is gegarandeerd dat alle adapters in de Frank configuraties zonder fouten zijn gestart.
