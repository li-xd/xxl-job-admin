FROM openjdk:8u212-jdk-alpine

ENV PARAMS=""

RUN cd /tmp && apk add git maven --no-cache &&\
    git clone https://github.com/xuxueli/xxl-job.git &&\
    cd xxl-job/ &&\
    mvn install &&\
    mv /xxl-job-admin/target/xxl-job-admin*.jar /usr/local/bin/xxl-job-admin.jar &&\
    rm -rf /tmp/xxl-job && \
    git del git maven

ENTRYPOINT ["sh","-c","java -jar /usr/local/bin/xxl-job-admin.jar $PARAMS"]