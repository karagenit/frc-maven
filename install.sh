#!/usr/bin/env bash

read -p "Group: " groupId
read -p "Artifact: " artifactId
read -p "Version: " version
read -p "File: " filePath
read -p "Sources: " sourcePath
read -p "Javadoc: " javadocPath

filePath=$(realpath $filePath)
repoPath=$(realpath ./maven)

mvn install:install-file \
    -DgroupId=$groupId -DartifactId=$artifactId -Dversion=$version \
    -Dfile=$filePath -Dpackaging=jar -DgeneratePom=true \
    -DlocalRepositoryPath=$repoPath -DcreateChecksum=true
