FROM jetbrains/teamcity-agent:latest
USER root
RUN  apt update && \
     apt upgrade -y && \
     apt install wget && \
     wget -c https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz && \
     tar -xvf openjdk-14.0.2_linux-x64_bin.tar.gz && \
     rm openjdk-14.0.2_linux-x64_bin.tar.gz && \
     mkdir -p /usr/lib/jvm/jdk-14 && \
     mv jdk-14*/* /usr/lib/jvm/jdk-14/ && \
     update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-14/bin/java" 1020 && \
     update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-14/bin/javac" 1020 && \
     curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose
