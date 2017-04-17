FROM centos:latest

MAINTAINER Y.Nishimura

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/calibre/lib
ENV PATH $PATH:/opt/calibre/bin

RUN yum install -y epel-release && \
    yum install -y nodejs && \
    yum install -y wget git && \
    yum install -y mesa-libGL qt5-qtbase-gui libXcomposite && \
    npm install --global phantomjs && \
    npm install --global gitbook-cli && gitbook fetch && \
    npm install --global gitbook-plugin-mermaid mermaid svgexport gitbook-plugin-hide-published-with && \
    npm cache clear && rm -rf /tmp/* && \
    wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main(install_dir='/opt', isolated=True)" && \
    rm -rf /tmp/calibre-installer-cache

WORKDIR /gitbook

VOLUME /gitbook

EXPOSE 4000 35729

CMD ["gitbook", "--help"]
