FROM jetbrains/teamcity-agent:latest
USER root
RUN  apt update && \
     apt upgrade -y && \
     apt install -y wget zip unzip && \
     wget -c https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz && \
     tar -xvf openjdk-13.0.2_linux-x64_bin.tar.gz && \
     rm openjdk-13.0.2_linux-x64_bin.tar.gz && \
     mkdir -p /usr/lib/jvm/jdk-13 && \
     mv jdk-13*/* /usr/lib/jvm/jdk-13/ && \
     update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-13/bin/java" 1020 && \
     update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-13/bin/javac" 1020 && \
     curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose
