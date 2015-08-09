FROM larsla/bash2rest

MAINTAINER Lars Larsson, "lars.la@gmail.com"

RUN rm -Rf /scripts
ADD scripts /scripts

VOLUME /logs

CMD /usr/bin/python /bash2rest/bash2rest.py
