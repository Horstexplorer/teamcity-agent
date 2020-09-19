FROM jetbrains/teamcity-agent:latest
USER root
RUN  apt update && \
     apt upgrade -y && \
     apt install wget && \
     wget -c https://download.java.net/java/GA/jdk15/779bf45e88a44cbd9ea6621d33e33db1/36/GPL/openjdk-15_linux-x64_bin.tar.gz && \
     tar -xvf openjdk-15_linux-x64_bin.tar.gz && \
     rm openjdk-15_linux-x64_bin.tar.gz && \
     mkdir -p /usr/lib/jvm/jdk-15 && \
     mv jdk-15*/* /usr/lib/jvm/jdk-15/ && \
     update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-15/bin/java" 1020 && \
     update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-15/bin/javac" 1020 && \
     curl -L https://github.com/docker/compose/releases/download/1.27.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose
