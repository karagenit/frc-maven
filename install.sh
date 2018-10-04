#!/usr/bin/env bash

read -p "Group: " groupId
read -p "Artifact: " artifactId
read -p "Version: " version
read -e -p "File: " filePath
read -e -p "Sources: " sourcePath
read -e -p "Javadoc: " javadocPath

filePath=$(realpath $filePath)
repoPath=$(realpath ./maven)
repoPath="file://${repoPath}"

mvn deploy:deploy-file \
    -DgroupId=$groupId -DartifactId=$artifactId -Dversion=$version \
    -Dfile=$filePath -Dpackaging=jar -DgeneratePom=true \
    -Durl=$repoPath -DcreateChecksum=true
