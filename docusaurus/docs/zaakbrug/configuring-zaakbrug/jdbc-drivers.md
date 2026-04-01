---
sidebar_position: 100
---

# JDBC Drivers
The container image includes JDBC drivers for the default in-memory H2 database and for PostgreSQL. If your deployment requires additional database or system-specific drivers, add the required `.jar` files to `/opt/frank/drivers`.

When adding custom drivers:
- use a driver version that is compatible with the target system;
- make sure the files are readable by the Frank runtime user `tomcat`(2000:2000);
- recreate or restart the container after updating the driver directory.

## Build a custom image
For production use, the recommended approach is to build your own image and include the required drivers in that image.

Example Dockerfile:
```dockerfile
FROM docker.io/wearefrank/zaakbrug:{[VERSION]}

ADD --chown=2000:2000 \
    --checksum={[CHECKSUM]} \
    {[URL_TO_DRIVER_JAR]} \
    /opt/frank/drivers/
```

Replace the placeholders as follows:
- `{[VERSION]}`: the ZaakBrug image tag to build from.
- `{[CHECKSUM]}`: the checksum of the driver artifact (recommended).
- `{[URL_TO_DRIVER_JAR]}`: the download URL to the driver `.jar` file.

## Provide drivers via a volume
If the same drivers are shared between multiple Frank!Framework deployments, mounting a volume can be more convenient. A common setup is to use a short-lived init container that downloads the required driver before ZaakBrug starts.

Example Docker Compose configuration with an init container:
```yaml
services:
  frank-init:
    image: alpine:latest
    volumes:
      - frank-drivers:/opt/frank/drivers
    environment:
      - POSTGRES_DRIVER_VERSION=${POSTGRES_DRIVER_VERSION:-42.7.10}
    entrypoint: >
      sh -c "
        POSTGRES_DRIVER_FILE=/opt/frank/drivers/postgresql-$$POSTGRES_DRIVER_VERSION.jar;
        if [ ! -f $$POSTGRES_DRIVER_FILE ]; then
          echo 'Downloading PostgreSQL JDBC driver version '$$POSTGRES_DRIVER_VERSION'...' &&
          wget -O $$POSTGRES_DRIVER_FILE https://github.com/pgjdbc/pgjdbc/releases/download/REL$$POSTGRES_DRIVER_VERSION/postgresql-$$POSTGRES_DRIVER_VERSION.jar;
        else
          echo 'Correct version already present.';
        fi
      "
    restart: "no"

  frank:
    image: wearefrank/zaakbrug:${VERSION:-1}
    depends_on:
      frank-init:
        condition: service_completed_successfully
    volumes_from:
      - frank-init

volumes:
  frank-drivers: {}
```
