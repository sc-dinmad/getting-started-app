FROM ubuntu:latest

LABEL version = "1.0"

RUN apt-get update && apt-get install -y libev-dev apt-utils python3 python3-pip wget

RUN mkdir /app
ADD . /app

WORKDIR /app

# TA-Lib dependency installation
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
  && tar -xzf ta-lib-0.4.0-src.tar.gz \
  && rm ta-lib-0.4.0-src.tar.gz \
  && cd ta-lib/ \
  && ./configure --prefix=/usr \
  && make \
  && make install \
  && rm -rf ta-lib/ \
  && cd ~ \
  && pip install ta-lib

RUN apt-get remove wget -y

EXPOSE 5000
