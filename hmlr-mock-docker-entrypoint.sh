#!/bin/bash

startApplication() {
    bash /docker-entrypoint.sh --global-response-templating --no-request-journal --disable-gzip --verbose --port=8082
}

main() {
    startApplication
}

main