#!/bin/bash

echo cd into folder ...
cd repo/LibraryProject2/

echo "=== Stopping App if running ==="
mvn spring-boot:stop || echo "App not running, skipping stop."

echo "=== Building App ==="
mvn clean package

echo  Run app ...
mvn spring-boot:start # to run in background