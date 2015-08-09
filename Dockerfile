#
# iDaddy Solr 5.0 Image
# Author: zoukunmin
#

FROM centos:7
MAINTAINER Dennis Zou <denniszou@gmail.com>

RUN yum -y install epel-release  \
    && yum -y update \
    && yum -y install java-1.8.0-openjdk tar \
    &&  yum -y clean all

WORKDIR /opt

# RUN curl -s http://mirrors.cnnic.cn/apache/lucene/solr/5.2.1/solr-5.2.1.tgz | tar xzf - \
RUN curl -s http://www.us.apache.org/dist/lucene/solr/5.2.1/solr-5.2.1.tgz | tar xzf - \
    && mv solr-5.2.1 solr \
    && mkdir -p /opt/solr/server/solr/lib/ \
    && cp /opt/solr/contrib/analysis-extras/lucene-libs/lucene-analyzers-smartcn-5.2.1.jar /opt/solr/server/solr/lib/

ADD ./mmseg4j-sor/* /opt/solr/server/solr/lib/

EXPOSE 8983

WORKDIR /opt/solr/server
CMD ["java", "-jar", "start.jar"]