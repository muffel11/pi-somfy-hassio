FROM alpine

RUN apk add alpine-sdk python3-dev py3-pip py3-requests
RUN wget --output-document=pigpio.zip https://github.com/joan2937/pigpio/archive/master.zip \
# Downloaded content is placed inside specific folder to not be depended of branch naming from repo
    && mkdir pigpio \
    && unzip -d pigpio pigpio.zip \
    && rm pigpio.zip \
    && cd /pigpio/* \
# Fix for compiling on Alpine, https://github.com/joan2937/pigpio/issues/107
    && sed -i -e 's/ldconfig/echo ldconfig disabled/g' Makefile \
    && find . -type f -exec sed -i -re 's#/dev/pig(pio|out|err)#/tmp/pig\1#g' {} \; \
    && make \
    && make install

RUN wget --output-document=somfy.zip https://github.com/Nickduino/Pi-Somfy/archive/refs/heads/master.zip \
    && mkdir somfy \
    && unzip -d somfy somfy.zip \
    && rm somfy.zip \
    && cd /somfy/* \
    && sed -i -e 's/sudo //' operateShutters.py \
    && pip3 install -r requirements.txt

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
