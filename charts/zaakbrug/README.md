# ZaakBrug 2.0

> [!WARNING]
> This Helm Chart has been moved. This Chart is deprecated but will stay for some time, so the users can migrate.

## New location

The source of the moved (and updated) Helm Chart can be found at: https://github.com/wearefrank/charts/tree/main/charts/zaakbrug

## Changes

The most notably changes are to the values.yaml  

Here is a diff with all changes:

```diff
 replicaCount: 1
 
 image:
-  repository: wearefrank/zaakbrug
-  pullPolicy: IfNotPresent
+  registry: wearefrank
+  repository: zaakbrug
   tag: ""
-
-imagePullSecrets: [ ]
+  pullPolicy: IfNotPresent
+  pullSecrets: [ ]
 
 nameOverride: ""
 fullnameOverride: ""
@@ -44,27 +44,14 @@ livenessProbe:
   timeoutSeconds: 1
   failureThreshold: 6
   successThreshold: 1
-
-readinessProbe:
-  initialDelaySeconds: 40
-  periodSeconds: 10
-  timeoutSeconds: 1
-  failureThreshold: 6
-  successThreshold: 1
-
-resources:
-  limits:
-    cpu: 2000m
-    memory: 2200M
-  requests:
-    cpu: 2000m
-    memory: 2200M
+resources: { }
 
 autoscaling:
   enabled: false
   minReplicas: 1
   maxReplicas: 100
   targetCPUUtilizationPercentage: 80
+  targetMemoryUtilizationPercentage: 80
 
 nodeSelector: { }
 
@@ -144,33 +131,39 @@ zaakbrug:
           coalesceResultaat: "Toegekend"
 
 frank:
-  memory: 2G
+  memory: 4G
   security:
     http:
       authentication: false
-      enforceHttps: false
-      tomcatUsers: [ ]
-      ad: { }
+      localUsers: [ ]
+      activeDirectory:
+        enabled: false
+        url: ""
+        baseDn: ""
+        roleMapping:
+          tester: ""
+          dataAdmin: ""
+          admin: ""
+          webService: ""
+          observer: ""
+  server:
+    transactionManager: NARAYANA
   credentials:
-    secret:
-    key:
+    secret: ""
+    key: ""
   instance:
-    name: "ZaakBrug"
+    name: ""
   dtap:
-    stage:
-    side: ""
+    stage: TST
+    side: cluster
   configurations:
-    names: "Translate"
-  properties: { }
+    names: [ ]
+  environmentVariables: { }
 
 connections:
-  jdbc:
-    - name: ""
-      type:
-      host:
-      ssl: ""
-      port: ""
-      database: ""
+  create: true
+  jdbc: [ ]
+  jms: [ ]
 
 staging:
   enabled: false
@@ -199,6 +192,7 @@ staging:
     autoscaling:
       enabled: false
     replicaCount: 1
+    podAnnotations: { }
     podLabels: { }
     securityContext:
       readOnlyRootFilesystem: true
@@ -206,9 +200,11 @@ staging:
       runAsNonRoot: true
       runAsUser: 1000
     image:
+      registry: ""
       repository: nginxinc/nginx-unprivileged
       tag: stable
       pullPolicy: IfNotPresent
+      pullSecrets: [ ]
     resources: { }
     existingConfigmap: ''
     service:
```

Note that some types have changes. E.g. the `frank.configuration.names` has changes from comma separates string to a list.

So, this: 

```yaml
frank: 
    configuration:
        names: "Configuration1,Configuration2,Configuration3"
```

Is changes to: 

```yaml
frank:
  configuration:
    names: 
      - Configuration1
      - Configuration2
      - Configuration3
```

## Why?

There are a couple of reasons that lead to this decision. 

For one, we wanted a central repository to store our Charts.
This makes it possible to create complex GitHub Actions without needing to create duplicates at different projects. 
This is more maintainable and simple. 

The central repository has GitHub Actions to release every Chart. The releases are available on GitHub as artifact and through the registry.
The registry is [wearefrank.github.io/charts](https://wearefrank.github.io/charts) and has its own website, for easy discovery.

The Chart has also been updated a bit (as mentioned in [Changes](#changes)). 
This is because it is now based on `ff-common`, a common library Chart for applications based on the Frank!Framework. 
Every change applied in `ff-common` will be easy to apply in `zaakbrug`. 
This way it stays up to date and gives the user a lot of possibilities in their configuration.