FROM centos:latest

MAINTAINER Y.Nishimura

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/calibre/lib
ENV PATH $PATH:/opt/calibre/bin

RUN yum install -y epel-release && \
    yum install -y python && \
    yum install -y nodejs && \
    yum install -y wget git bzip2 && \
    yum install -y mesa-libGL qt5-qtbase-gui libXcomposite graphviz && \
    yum install -y java-1.8.0-openjdk-headless && \
    npm install --global phantomjs-prebuilt  && \
    npm install --global gitbook-cli && gitbook fetch && \
    npm install --global mermaid svgexport && \
    npm cache clear && rm -rf /tmp/* && \
    wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main(install_dir='/opt', isolated=True)" && \
    rm -rf /tmp/calibre-installer-cache

WORKDIR /gitbook

VOLUME /gitbook

EXPOSE 4000 35729

CMD ["gitbook", "--help"]
