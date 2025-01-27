FROM mwizner/sonarqube:8.7.1-community

# Skyscanner plugins
ENV SONAR_JAVA_SECRETS_PLUGIN_VERSION 1.3.0
RUN apk add --no-cache --virtual build-dependencies gnupg unzip curl; \
    cd $SONARQUBE_HOME/extensions/plugins && \
    curl --fail --silent --show-error --location --output sonar-secrets-java-${SONAR_JAVA_SECRETS_PLUGIN_VERSION}.jar \
    https://github.com/Skyscanner/sonar-secrets/releases/download/v${SONAR_JAVA_SECRETS_PLUGIN_VERSION}/sonar-secrets-java-${SONAR_JAVA_SECRETS_PLUGIN_VERSION}.jar

ENV SONAR_JS_SECRETS_PLUGIN_VERSION 1.3.0
RUN apk add --no-cache --virtual build-dependencies gnupg unzip curl; \
    cd $SONARQUBE_HOME/extensions/plugins && \
    curl --fail --silent --show-error --location --output sonar-secrets-javascript-${SONAR_JS_SECRETS_PLUGIN_VERSION}.jar \
    https://github.com/Skyscanner/sonar-secrets/releases/download/v${SONAR_JS_SECRETS_PLUGIN_VERSION}/sonar-secrets-javascript-${SONAR_JS_SECRETS_PLUGIN_VERSION}.jar

ENTRYPOINT ${SONARQUBE_HOME}/bin/run.sh
