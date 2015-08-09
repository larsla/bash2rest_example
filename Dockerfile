FROM larsla/bash2rest
ADD scripts /scripts
VOLUME /logs
CMD /usr/bin/python /bash2rest/bash2rest.py
