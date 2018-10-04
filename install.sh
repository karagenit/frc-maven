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

sourceFlag=""
javadocFlag=""

if [[ ! -z "$sourcePath" ]]; then
    sourcePath=$(realpath $sourcePath)
    sourceFlag="-Dsources=${sourcePath}"
fi

if [[ ! -z "$javadocPath" ]]; then
    javadocPath=$(realpath $javadocPath)
    javadocFlag="-Djavadoc=${javadocPath}"
fi

mvn deploy:deploy-file \
    -DgroupId=$groupId -DartifactId=$artifactId -Dversion=$version \
    -Dfile=$filePath -Dpackaging=jar -DgeneratePom=true \
    -Durl=$repoPath -DcreateChecksum=true $sourceFlag $javadocFlag
