FROM debian:latest

RUN apt update && apt install -y qt6-base-dev qt6-svg-dev postgresql g++ make wget libpqxx-dev libxml++2.6-dev libxext-dev

WORKDIR /src/

ARG VERSION="1.1.3"

RUN wget -O pgmodeler-v${VERSION}.tar.gz https://codeload.github.com/pgmodeler/pgmodeler/tar.gz/refs/tags/v${VERSION} && \
    tar -xvf pgmodeler-v${VERSION}.tar.gz

ENV QT_ROOT=/usr/lib/qt6/
ENV INSTALLATION_ROOT=/opt/pgmodeler/
ENV PGSQL_ROOT=/lib/postgresql/15/
ENV PGMODELER_SOURCE=/src/pgmodeler-${VERSION}/

WORKDIR $PGMODELER_SOURCE

RUN $QT_ROOT/bin/qmake -r CONFIG+=release PREFIX=$INSTALLATION_ROOT BINDIR=$INSTALLATION_ROOT PRIVATEBINDIR=$INSTALLATION_ROOT PRIVATELIBDIR=$INSTALLATION_ROOT/lib pgmodeler.pro && \
make -j $(nproc) && make install

ENTRYPOINT ["/opt/pgmodeler/pgmodeler"]