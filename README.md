# iDaddy Solr 5.2.1 image

## 镜像内容：
* 基础镜像： centos7
* open jdk 1.8.0
* mmseg4j中文分词扩展
* lucene-analyzers-smartcn-5.2.1.jar

## 使用说明

1. 独立运行
执行：
```
docker -d -p 8983:8983 idaddy/solr
```
启动独立的solr，启动之后公国浏览器访问 http://localhost:8983/solr 访问solr接口

2. 独立配置、数据目录
通过执行：
```
docker -d -p 8983:8983 -v path/to/local/data:/opt/solr/server/solr/<instance-name> idaddy/solr
```
将本地目录映射到容器内部，本地目录内可以包含solr配置及数据

