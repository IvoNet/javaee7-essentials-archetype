# Java EE 7 Essential Archetype


This is a minimal Java 8 / Java EE 7 archetype.

# Get started

* [Java EE /Jakarta EE - Initializr](http://ivo2u.nl/oq)

## Install in local repo

```bash
mvn dependency:get \
   -DgroupId=nl.ivonet \
   -DartifactId=javaee7-essentials-archetype \
   -Dversion=0.0.3
   
mvn archetype:crawl   
```

## Run from mvn central repo

```bash
mvn archetype:generate \
    -DarchetypeGroupId=nl.ivonet \
    -DarchetypeArtifactId=javaee7-essentials-archetype \
    -DarchetypeVersion=0.0.3 -U
```

## Run if offline available

```bash
mvn archetype:generate -Dfilter=nl.ivonet:
```

this will filter the archetype list on my groupId