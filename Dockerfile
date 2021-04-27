FROM jetbrains/teamcity-agent:latest
USER root
RUN  apt update && \
     apt upgrade -y && \
     apt install wget zip unzip && \
     wget -c https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_linux-x64_bin.tar.gz && \
     tar -xvf openjdk-16_linux-x64_bin.tar.gz && \
     rm openjdk-16_linux-x64_bin.tar.gz && \
     mkdir -p /usr/lib/jvm/jdk-16 && \
     mv jdk-16*/* /usr/lib/jvm/jdk-16/ && \
     update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-16/bin/java" 1020 && \
     update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-16/bin/javac" 1020 && \
     curl -L https://github.com/docker/compose/releases/download/1.29.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose
