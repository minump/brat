FROM httpd

RUN \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
        ca-certificates \
	python-is-python3 \
        wget

RUN mkdir brat
COPY brat-1.3p1/ brat/

ADD httpd.conf /usr/local/apache2/conf/
ADD install.sh /usr/local/apache2/htdocs/brat/

RUN /usr/local/apache2/htdocs/brat/install.sh admin password admin@example.com
