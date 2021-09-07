
### copyright 2017-2021 Regents of the University of California and the Broad Institute. All rights reserved.
FROM genepattern/docker-python36:0.4

RUN useradd -ms /bin/bash gpuser
USER gpuser
WORKDIR /home/gpuser

#switch back to root to create dir
USER root
RUN mkdir /ExampleModule \
    && chown gpuser /ExampleModule

#switch to non-root before exiting so that we don't run as root on the server, and copy all of the src files into the container.
USER gpuser
COPY src/*.py /ExampleModule/

RUN /ExampleModule/ExampleModule.py
