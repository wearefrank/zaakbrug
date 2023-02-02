# ZaakBrug 2.0

## Installation

### Required values

Some values need to be filled in for the Frank! to work. 

These values are:

- frank.instance.name
- frank.dtap.stage
- connections.jdbc (we're working on a disable database option)

### ZaakBrug values

For the ZaakBrug to work correctly some values need to be verified and other have to be filled in. 

Check if all the zgw.endpoints are configured right. Add a configMap to both zgw.globalsConfigMap and zgs.profilesConfigMap

#### Globals and Profiles

The Globals.json should contain organizations and role mappings. 

The Profiles.json contains information about zaakTypes. The reason this file is separate, is to make it more sharable with other gemeentes. 

These files need to be added to the namespace as a configMap. The name of the configMap and the key of the data should be added in the values.yaml under .name and .subPath.

### Credentials

The credentials are added differently so the server can handle them differently. The credentials won't be logged or shown, in contrary to all other properties. 

#### Database credentials

User and password can be set with values like so:

```yaml
username: postgres
password: ExamplePassword
# Or with property parameters
username: ${database/username}
password: ${database/password}
```

A nice way to set the variables is with a credentials.properties. 

The property parameters used for the values will point to the right credential in the credentials.properties (you can call it differently) file. 

Create a secret with the properties you want to set, for example:

```properties
database/username=test
database/password=test
```

Now set the values: frank.credentials.secret (secret name) and frank.credentials.key (key of the data)

#### Zaak JWT

The ZaakBrug will automatically generate a JWT token. 

To set the client id and secret, add these credentials to your credentials secret (the one mentioned above).

```properties
zaken-api.jwt/username=ZaakBrug
zaken-api.jwt/password=secret1234
```

The username is used for the client is and the password is used for the secret.