FROM docker.cloudtrain.aws.msgoat.eu/cloudtrain/at41-docker-jre11:4.0.0 AS builder

ARG ARG_PAYARA_HOME=/opt/payara
ARG ARG_PAYARA_ADMIN_USER=admin
ARG ARG_PAYARA_ADMIN_PASSWORD=admin
ARG ARG_PAYARA_DOMAIN_NAME=domain1
ARG ARG_PAYARA_VERSION=5.2021.7
ARG ARG_PAYARA_PKG_URL=https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${ARG_PAYARA_VERSION}/payara-${ARG_PAYARA_VERSION}.zip
ARG ARG_PAYARA_USER=payara
ARG ARG_PAYARA_UID=1234
ARG ARG_PAYARA_GROUP=payara
ARG ARG_PAYARA_GID=1234

LABEL maintainer="michael.theis@msg.group"

# Initialize the configurable environment variables
ENV HOME_DIR=$ARG_PAYARA_HOME \
    PAYARA_DIR=$ARG_PAYARA_HOME/appserver \
    SCRIPT_DIR=$ARG_PAYARA_HOME/scripts \
    CONFIG_DIR=$ARG_PAYARA_HOME/config \
    DEPLOY_DIR=$ARG_PAYARA_HOME/deployments \
    PASSWORD_FILE=$ARG_PAYARA_HOME/passwordFile \
    PAYARA_VERSION=$ARG_PAYARA_VERSION \
    # Payara Server Domain options
    DOMAIN_NAME=$ARG_PAYARA_DOMAIN_NAME \
    ADMIN_USER=$ARG_PAYARA_ADMIN_USER \
    ADMIN_PASSWORD=$ARG_PAYARA_ADMIN_PASSWORD \
    # Utility environment variables
    JVM_ARGS= \
    PAYARA_ARGS= \
    DEPLOY_PROPS= \
    POSTBOOT_COMMANDS=$ARG_PAYARA_HOME/config/post-boot-commands.asadmin \
    PREBOOT_COMMANDS=$ARG_PAYARA_HOME/config/pre-boot-commands.asadmin

RUN echo "install missing packages" && \
    apt-get update && \
    apt-get install --yes --no-install-recommends wget unzip && \
    apt-get clean && \
    echo "create payara appserver folders" && \
    mkdir -p ${DEPLOY_DIR} && \
    mkdir -p ${CONFIG_DIR} && \
    mkdir -p ${SCRIPT_DIR} && \
    echo "download and unpack payara appserver binaries" && \
    wget --no-verbose -O /tmp/payara.zip ${ARG_PAYARA_PKG_URL} && \
    unzip -qq /tmp/payara.zip -d ${HOME_DIR} && \
    mv ${HOME_DIR}/payara5 ${PAYARA_DIR}/ && \
    rm -f /tmp/payara.zip && \
    echo "configure the password file for configuring Payara" && \
    echo "AS_ADMIN_PASSWORD=\nAS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}\n\n" | tee /tmp/tmpfile && \
    echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}\n\n" | tee ${PASSWORD_FILE} && \
    cat /tmp/tmpfile && \
    echo "configure the payara domain" && \
    cd ${HOME_DIR} && \
    ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=/tmp/tmpfile change-admin-password --domain_name ${DOMAIN_NAME} && \
    ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} start-domain ${DOMAIN_NAME} && \
    ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} enable-secure-admin && \
    for MEMORY_JVM_OPTION in $(${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} list-jvm-options | grep "Xm[sx]"); do\
        ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} delete-jvm-options $MEMORY_JVM_OPTION;\
    done && \
    ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} stop-domain ${DOMAIN_NAME} && \
    echo "cleanup unused files" && \
    rm -rf \
        /tmp/tmpFile \
        payara.zip \
        ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/osgi-cache \
        ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/logs

FROM adoptopenjdk/openjdk11:alpine-jre

ARG ARG_PAYARA_HOME=/opt/payara
ARG ARG_PAYARA_ADMIN_USER=admin
ARG ARG_PAYARA_ADMIN_PASSWORD=admin
ARG ARG_PAYARA_DOMAIN_NAME=domain1
ARG ARG_PAYARA_VERSION=5.2021.7
ARG ARG_PAYARA_PKG_URL=https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${ARG_PAYARA_VERSION}/payara-${ARG_PAYARA_VERSION}.zip
ARG ARG_PAYARA_USER=payara
ARG ARG_PAYARA_UID=1234
ARG ARG_PAYARA_GROUP=payara
ARG ARG_PAYARA_GID=1234

# Initialize the configurable environment variables
ENV HOME_DIR=$ARG_PAYARA_HOME \
    PAYARA_DIR=$ARG_PAYARA_HOME/appserver \
    SCRIPT_DIR=$ARG_PAYARA_HOME/scripts \
    CONFIG_DIR=$ARG_PAYARA_HOME/config \
    DEPLOY_DIR=$ARG_PAYARA_HOME/deployments \
    PASSWORD_FILE=$ARG_PAYARA_HOME/passwordFile \
    PAYARA_VERSION=$ARG_PAYARA_VERSION \
    # Payara Server Domain options
    DOMAIN_NAME=$ARG_PAYARA_DOMAIN_NAME \
    ADMIN_USER=$ARG_PAYARA_ADMIN_USER \
    ADMIN_PASSWORD=$ARG_PAYARA_ADMIN_PASSWORD \
    # Utility environment variables
    JVM_ARGS= \
    PAYARA_ARGS= \
    DEPLOY_PROPS= \
    POSTBOOT_COMMANDS=$ARG_PAYARA_HOME/config/post-boot-commands.asadmin \
    PREBOOT_COMMANDS=$ARG_PAYARA_HOME/config/pre-boot-commands.asadmin

RUN echo "adding run user payara to system" && \
    addgroup --gid $ARG_PAYARA_GID --system $ARG_PAYARA_GROUP && \
    adduser --system --home ${HOME_DIR} --shell /bin/bash  --ingroup $ARG_PAYARA_GROUP --uid $ARG_PAYARA_UID $ARG_PAYARA_USER && \
    chown -R ${ARG_PAYARA_USER}:${ARG_PAYARA_GROUP} ${HOME_DIR}

USER payara
WORKDIR ${HOME_DIR}
COPY --from=builder --chown=${ARG_PAYARA_USER}:${ARG_PAYARA_GROUP} ${HOME_DIR} .

# Copy across docker scripts
COPY --chown=payara:payara *.sh ${SCRIPT_DIR}/
RUN chmod +x ${SCRIPT_DIR}/*.sh

# Default payara ports to expose
EXPOSE 4848 8009 8080 8181

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]
CMD ["start-domain"]