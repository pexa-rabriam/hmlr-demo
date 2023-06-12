FROM wiremock/wiremock:2.35.0

COPY hmlr-mock-server/resources/mappings mappings
COPY hmlr-mock-server/resources/__files __files
COPY hmlr-mock-docker-entrypoint.sh .

EXPOSE 8082

ENTRYPOINT ["bash", "/home/wiremock/hmlr-mock-docker-entrypoint.sh"]
